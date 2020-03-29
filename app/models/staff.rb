class Staff < ApplicationRecord
	belongs_to :registering, class_name: "User"
	belongs_to :registered, class_name: "User"
end
