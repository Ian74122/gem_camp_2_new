class CreatePostsCountPreviews < ActiveRecord::Migration[7.0]
  def change
    create_view :post_count_previews
  end
end
