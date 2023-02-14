class Book < ApplicationRecord
    
    has_many :book_tags, dependent: :destroy
    has_many :tags, through: :book_tags
    mount_uploader :image, ImageUploader
end
