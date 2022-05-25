class Item < ApplicationRecord
  belongs_to :genre

# 商品画像アップロード
  has_one_attached :image

  def get_image
    unless image.attached?(width, height)
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width,height]).processed
  end
end
