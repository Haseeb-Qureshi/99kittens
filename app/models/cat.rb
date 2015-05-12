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
#  birth_year  :integer
#

class Cat < ActiveRecord::Base
  validates :color, :name, :sex, presence: true
  validates :color, inclusion: { in: %w(red brown black white calico) }
  validates :sex, length: { is: 1 }, inclusion: { in: ['M', 'F'] }

  def age
    Time.now.year - birth_year
  end

end
