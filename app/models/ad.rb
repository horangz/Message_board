class Ad < ActiveRecord::Base
	belongs_to :categories
	
	attr_accessible :title, :content, :category_id
	
	validates :category_id, presence: true
	
	validates :title, presence: true,
										length: { maximum: 25 }
										
	validates :content, presence: true,
											length: { maximum: 140 }
	
	PerPage = 3
  def self.page(pg)
    pg = pg.to_i
    self.order('id desc').offset((pg-1)*PerPage).limit(PerPage)
  end
 
  def self.pgcount
    count % PerPage == 0 ? count / PerPage : count / PerPage + 1
  end
end
