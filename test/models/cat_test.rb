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

require 'test_helper'

class CatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
