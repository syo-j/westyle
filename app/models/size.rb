class Size < ApplicationRecord
	has_many :clothes, dependent: :destroy
end
