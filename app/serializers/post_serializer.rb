class PostSerializer < ActiveModel::Serializer
  attributes :title, :content, :created_at, :author, :comments_count

  def created_at
    object.created_at.strftime("%F %H:%M:%S")
  end

  def author
    object.user.email
  end

end
