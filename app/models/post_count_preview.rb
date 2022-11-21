class PostCountPreview < ApplicationRecord
  belongs_to :post
  def readonly?
    true
  end
end
