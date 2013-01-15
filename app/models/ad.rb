class Ad < ActiveRecord::Base
	belongs_to :categories
	
	attr_accessible :title, :content, :category_id, :city, :address, :email
	
	email_regex = /^[-a-z0-9!#$&'*+=?^_`{|}~]+(\.[-a-z0-9!#$&'*+=?^_`{|}~]+)*@([a-z0-9]([-a-z0-9]{0,61}[a-z0-9])?\.)*(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|[a-z][a-z])$/i
	
	validates :category_id, presence: true
	
	validates :title, presence: true,
										length: { maximum: 25 }
										
	validates :content, presence: true,
											length: { maximum: 140 }
											
	validates :email, presence: true,
										format: { with: email_regex }		

	validates :city, presence: true,
										length: { maximum: 25 }

	validates :address, presence: true,
										length: { maximum: 35 }									
	
	PerPage = 3
  def self.page(pg)
    pg = pg.to_i
    self.order('id desc').offset((pg-1)*PerPage).limit(PerPage)
  end
 
  def self.pgcount
    count % PerPage == 0 ? count / PerPage : count / PerPage + 1
  end
end
