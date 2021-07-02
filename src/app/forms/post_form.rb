class PostForm
  include ActiveModel::Model

  attr_accessor :title, :category, :catchphrase, :servis_content, :evelopment_background, :user_id, :site_url, :thumbnail_img, :post_id

  with_options presence: true do
    validates :title,                 presence: { message: 'タイトルを入力してください' }, length: { maximum: 50 }
    validates :catchphrase,           presence: { message: 'キャッチフレーズを入力してください' }, length: { maximum: 50 }
    validates :servis_content,        presence: { message: 'サービス内容を入力してください' }, length: { maximum: 500 }
    validates :evelopment_background, presence: { message: '開発背景を入力してください' }, length: { maximum: 500 }
    validates :category,              presence: { message: 'カテゴリーを選択してください' }
  end

  validates :site_url, 
    length: { maximum: 100, message: '100文字以下で入力してください' },
    format: { with: /\A#{URI::regexp(%w(http https))}\z/, message: 'http/httpsの形式で入力してください' }, allow_blank: true

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
