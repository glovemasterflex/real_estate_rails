class Home < ActiveRecord::Base
	belongs_to :agent
	has_one :address, dependent: :destroy
end
