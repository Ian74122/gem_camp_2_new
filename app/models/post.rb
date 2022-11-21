class Post < ApplicationRecord
  default_scope { where(delete_at: nil) }
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships
  has_one :post_count_preview
  belongs_to :user
  belongs_to :region, class_name: 'Address::Region', foreign_key: 'address_region_id'
  belongs_to :province, class_name: 'Address::Province', foreign_key: 'address_province_id'
  mount_uploader :image, ImageUploader
  def destroy
    update(delete_at: Time.now)
  end
end
