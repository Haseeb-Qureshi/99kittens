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
#  birth_date  :datetime         default(Thu, 13 May 2010 20:09:34 UTC +00:00), not null
#  user_id     :integer
#

require 'test_helper'

class CatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
