class PostForm
  include ActiveModel::Model

  attr_accessor :title, :category, :catchphrase, :servis_content, :evelopment_background, :user_id, :site_url, :thumbnail_img, :post_id

  with_options presence: true do
    validates :title,                 presence: { message: 'タイトルを入力してください' }
    validates :catchphrase,           presence: { message: 'キャッチフレーズを入力してください' }
    validates :servis_content,        presence: { message: 'サービス内容を入力してください' }
    validates :evelopment_background, presence: { message: '開発背景を入力してください' }
    validates :category,              presence: { message: 'カテゴリーを選択してください' }
  end

  def save
    @post = Post.create(
      user_id: user_id,
      title: title,
      category: category,
      catchphrase: catchphrase,
      servis_content: servis_content,
      evelopment_background: evelopment_background
    )

    PostArbitrary.create(
      post_id: @post.id,
      site_url: site_url,
      thumbnail_img: thumbnail_img
    )
  end
end
