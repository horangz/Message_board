class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	
	email_regex = /^[-a-z0-9!#$&'*+=?^_`{|}~]+(\.[-a-z0-9!#$&'*+=?^_`{|}~]+)*@([a-z0-9]([-a-z0-9]{0,61}[a-z0-9])?\.)*(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|[a-z][a-z])$/i
	
	validates :name, presence: true,
									 length: { maximum: 50 }
									 
	validates :email, presence: true,
										uniqueness: { case_sensitive: false },
										format: { with: email_regex }
end
