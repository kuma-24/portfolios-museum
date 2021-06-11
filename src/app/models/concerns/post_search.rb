module PostSearch
  extend ActiveSupport::Concern

  included do
    def self.search(search)
      return Post.all.includes(:user, :likes, :post_arbitrary).order(created_at: :desc) unless search

      Post.where(
        'title LIKE ? OR catchphrase LIKE ? OR servis_content LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"
      ).includes(:user, :likes, :post_arbitrary).order(created_at: :desc)
    end

    def self.sort_category(selection)
      Post.where('category LIKE ?', "%#{selection}%").includes(:user, :likes, :post_arbitrary).order(created_at: :desc)
    end
  end
end
