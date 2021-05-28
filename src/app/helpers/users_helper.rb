module UsersHelper
  def industry_box
    {
      'エンジニア': 'エンジニア',
      'デザイナー': 'デザイナー',
      'クリエイター': 'クリエイター',
      'ライター': 'ライター',
      'アニメーター': 'アニメーター',
      'グラフィッカー': 'グラフィッカー',
      'イラストレーター': 'イラストレーター'
    }
  end

  def self.random_alphanumeric
    alphabet = (0...3).map { ('a'..'z').to_a[rand(26)] }.join
    int = (0...3).map { ('0'..'9').to_a[rand(10)] }.join
    alphanumeric = alphabet + int
  end
end
