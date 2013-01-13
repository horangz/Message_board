class Category < ActiveRecord::Base
	attr_accessible :name
	
	has_many :ads, dependent: :destroy
	
	validates :name, presence: true, length: { maximum: 25 }
end
