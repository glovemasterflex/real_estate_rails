class User < ActiveRecord::Base

  validates_uniqueness_of :email
  validates_presence_of :email, :password_digest
  has_secure_password
  has_one :account
  after_create :create_account

  def create_account
    Account.create(user_id: self.id)
  end
end
