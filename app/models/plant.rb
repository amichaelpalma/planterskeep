class Plant < ApplicationRecord

  belongs_to :user

  scope :with_eager_loaded_image, -> { eager_load(image_attachment: :blob) }
  scope :with_preloaded_image, -> { preload(image_attachment: :blob) }
  
  has_one_attached :image
end