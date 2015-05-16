# == Schema Information
#
# Table name: sessions
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  session_token :string           not null
#  created_at    :datetime
#  updated_at    :datetime
#  details       :string           not null
#

class Session < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :session_token, presence: true

  def self.create(attrs)
    #technically should check for collision, but whatever
    super(
      user_id: attrs[:user_id],
      details: attrs[:details],
      session_token: SecureRandom.urlsafe_base64
    )
  end
end
