class PostForm
  include ActiveModel::Model
  attr_accessor :title, :catchphrase, :servis_content, :evelopment_background, :thumbnail_img, :user_id

  with_options presence: true do
    validates :title,                 presence: { message: 'タイトルを入力してください' }
    validates :catchphrase,           presence: { message: 'キャッチフレーズを入力してください' }
    validates :servis_content,        presence: { message: 'サービス内容を入力してください' }
    validates :evelopment_background, presence: { message: '開発背景を入力してください' }
    validates :thumbnail_img,         presence: { message: 'サムネイル画像を入力してください' }
  end

  def save
    @post = Post.create(
      user_id: user_id,
      title: title,
      catchphrase: catchphrase,
      servis_content: servis_content,
      evelopment_background: evelopment_background,
      thumbnail_img: thumbnail_img
    )
  end
end
