class Home < ActiveRecord::Base
	belongs_to :agent
	has_one :address, dependent: :destroy
	has_many :likes
	has_many :users, through: :likes
end
