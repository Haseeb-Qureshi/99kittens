# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  color       :string
#  name        :string           not null
#  sex         :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  birth_date  :datetime         not null
#  user_id     :integer
#

class Cat < ActiveRecord::Base
  validates :color, :name, :sex, :user_id, :birth_date, presence: true
  validates :color, inclusion: { in: %w(red brown black white calico),
    message: "must be selected." }
  validates :sex, inclusion: { in: ['M', 'F'],
    message: "must be selected." }
  validate :true_to_name

  belongs_to :owner, class_name: 'User', foreign_key: :user_id, primary_key: :id
  has_many :cat_rental_requests

  def place_kitten
    num = (id % 6) + 350
    "http://placekitten.com/g/#{num+5}/#{num+20}"
  end

  private

  def true_to_name
    errors.add(:cats, "can't exceed 99. Come on now.") if Cat.count >= 99
  end
end
