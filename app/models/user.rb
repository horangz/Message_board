class User < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation
	
	email_regex = /^[-a-z0-9!#$&'*+=?^_`{|}~]+(\.[-a-z0-9!#$&'*+=?^_`{|}~]+)*@([a-z0-9]([-a-z0-9]{0,61}[a-z0-9])?\.)*(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|[a-z][a-z])$/i
	
	validates :name, presence: true,
									 length: { maximum: 50 }
									 
	validates :email, presence: true,
										uniqueness: { case_sensitive: false },
										format: { with: email_regex }
										
	validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }		

	before_save :encrypt_password
	
	def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  private

    def encrypt_password
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash(string)
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end									 
end
