class Shop < ApplicationRecord
	
	belongs_to :user, inverse_of: :shop
end
