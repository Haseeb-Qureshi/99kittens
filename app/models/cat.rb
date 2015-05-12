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
#  birth_date  :datetime         default(Tue, 12 May 2015 23:05:12 UTC +00:00), not null
#

class Cat < ActiveRecord::Base
  has_many :cat_rental_requests
  validates :color, :name, :sex, presence: true
  validates :color, inclusion: { in: %w(red brown black white calico) }
  validates :sex, length: { is: 1 }, inclusion: { in: ['M', 'F'] }
end


# TA: strftime pretty birth_date
# TA: CSS
# Nicer error messages (locales)
# Hash placekitten imnages
