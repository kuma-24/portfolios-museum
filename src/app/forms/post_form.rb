class PostForm
  include ActiveModel::Model
  extend CarrierWave::Mount
  
  attr_accessor :title, :category, :catchphrase, :servis_content, :evelopment_background, :user_id, :site_url, :thumbnail_img, :post_id
  attr_accessor :site_url, :thumbnail_img, :post_id
  

  with_options presence: true do
    validates :title,                 presence: { message: 'タイトルを入力してください' }, length: { maximum: 50 }
    validates :catchphrase,           presence: { message: 'キャッチフレーズを入力してください' }, length: { maximum: 50 }
    validates :servis_content,        presence: { message: 'サービス内容を入力してください' }, length: { maximum: 500 }
    validates :evelopment_background, presence: { message: '開発背景を入力してください' }, length: { maximum: 500 }
    validates :category,              presence: { message: 'カテゴリーを選択してください' }
  end
  
  with_options allow_blank: true do
    validates :site_url,
    length: { maximum: 100, message: '100文字以下で入力してください' },
    format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/, message: 'http/httpsの形式で入力してください' }
  end

  delegate :persisted?, to: :post
  
  def initialize(attributes = nil, post: Post.new)
    @post = post
    attributes ||= default_attributes
    super(attributes)
  end
  
  def save
    ActiveRecord::Base.transaction do
      if Post.exists?(id: @post.id)
        @post.update(
          user_id: user_id,
          title: title,
          category: category,
          catchphrase: catchphrase,
          servis_content: servis_content,
          evelopment_background: evelopment_background,
        )
        @post.post_arbitrary.update(
          site_url: site_url,
          thumbnail_img: thumbnail_img,
          post_id: @post.id
        )
      else
        @post = Post.create!(
          user_id: user_id,
          title: title,
          category: category,
          catchphrase: catchphrase,
          servis_content: servis_content,
          evelopment_background: evelopment_background,
        )
        PostArbitrary.create!(
          post_id: @post.id,
          site_url: site_url,
          thumbnail_img: thumbnail_img
        )
      end
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def to_model
    post
  end

  attr_reader :post
  
  def default_attributes
    {
      user_id: post.user_id,
      title: post.title,
      category: post.category, 
      catchphrase: post.catchphrase, 
      servis_content: post.servis_content,
      evelopment_background: post.evelopment_background,
      site_url: @post.post_arbitrary&.site_url,
      thumbnail_img: @post.post_arbitrary&.thumbnail_img,
      post_id: @post.post_arbitrary&.post_id
    }
  end
end
