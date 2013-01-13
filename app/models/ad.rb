class Ad < ActiveRecord::Base
	belongs_to :categories
	
	validates :user_id, presence: true
	
	PerPage = 3
  def self.page(pg)
    pg = pg.to_i
    self.order('id desc').offset((pg-1)*PerPage).limit(PerPage)
  end
 
  def self.pgcount
    count % PerPage == 0 ? count / PerPage : count / PerPage + 1
  end
	
end
