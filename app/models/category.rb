class Category < ApplicationRecord

	mount_uploader :item, ItemUploader
end
