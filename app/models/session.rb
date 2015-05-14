# == Schema Information
#
# Table name: sessions
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  session_token :string
#  created_at    :datetime
#  updated_at    :datetime
#

class Session < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :session_token, presence: true

  def self.create(attrs)
    #technically should check for collision, but whatever
    super(user_id: attrs[:user_id], session_token: SecureRandom.urlsafe_base64)
  end
end
