class Clothe < ApplicationRecord
	belongs_to :category, optional: true
	belongs_to :color, optional: true
	belongs_to :size, optional: true

	belongs_to :post, optional: true
	
	

end
