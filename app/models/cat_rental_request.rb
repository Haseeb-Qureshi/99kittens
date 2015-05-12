# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :datetime         not null
#  end_date   :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string           not null
#@

class CatRentalRequest < ActiveRecord::Base
  belongs_to :cat
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"] }
  validate :doesnt_overlap_existing_approved_request
  after_initialize :set_status

  def approve!
    CatRentalRequest.transaction do
      overlapping_requests.where(status: 'PENDING').update_all(status: "DENIED")
      update! status: 'APPROVED'
    end
  end

  def deny!
    update! status: 'DENIED'
  end

  def pending?
    status == 'PENDING'
  end

  private

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: cat_id)
      .where('(:start_date > start_date AND :end_date > end_date) OR
               :start_date < end_date AND :end_date < end_date',
              { start_date: start_date, end_date: end_date } )
      .where.not(id: id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end


  def doesnt_overlap_existing_approved_request
    errors.add(:requests, "cannot overlap") if overlapping_approved_requests.any?
  end

  def set_status
    self.status ||= "PENDING"
  end
end
