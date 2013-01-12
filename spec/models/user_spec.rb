require 'spec_helper'

describe User do
  
	before(:each) do
		@attr = { name: 'Anton', email: 'horangz@mail.ru' }
	end
	
	it 'should create a new user' do
		User.create!(@attr)
	end
	
	describe 'name tests' do
	
		it 'should require a name' do
			no_name_user = User.new(@attr.merge(name: ''))
			no_name_user.should_not be_valid
		end
		
		it 'should reject the long name' do
			long_name = '1' * 51
			long_name_user = User.new(@attr.merge(name: long_name))
			long_name_user.should_not be_valid
		end
	end
	
	describe 'email tests' do
	
		it 'should require a email' do
			no_name_user = User.new(@attr.merge(email: ''))
			no_name_user.should_not be_valid
		end
	
		it 'should accept valid addresses' do
			addresses = %w[horangz@mail.ru THE_US-ER@foo.bar.org first.last@foo.jp]
			addresses.each do |address|
				valid_email_user = User.new(@attr.merge(email: address))
				valid_email_user.should be_valid
			end
		end
		
		it 'should reject invalid addresses' do
			addresses = %w[horangz@mail,ru THE_US-ER@foo.bar.org! first@last@foo.jp]
			addresses.each do |address|
				valid_email_user = User.new(@attr.merge(email: address))
				valid_email_user.should_not be_valid
			end	
		end
		
		it 'should reject duplicate email addresses' do
			User.create!(@attr)
			user_with_duplicate_email = User.new(@attr)
			user_with_duplicate_email.should_not be_valid
		end
		
		it 'should reject email addresses identical up to case' do
			upcased_email = @attr[:email].upcase
			User.create!(@attr.merge(email: upcased_email))
			user_with_duplicate_email = User.new(@attr)
			user_with_duplicate_email.should_not be_valid
		end
	end	
end
