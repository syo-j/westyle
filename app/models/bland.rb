class Bland < ApplicationRecord
	has_many :clothes, dependent: :destroy
end
