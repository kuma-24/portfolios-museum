class Profile < ApplicationRecord
  mount_uploader :avatar_img, AvatarImgUploader
  belongs_to :user

  def self.guest_profile
    Profile.find_or_create_by!(user_id: 1) do |profile|
      profile.avatar_img = ''
      profile.self_introduction = ''
    end
  end

  validates :self_introduction, length: { maximum: 150 }
end
