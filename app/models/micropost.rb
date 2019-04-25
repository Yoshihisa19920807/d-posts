class Micropost < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size
  
private
# アップロード画像のサイズを検証する
    def picture_size
        if picture.size > 5.megabytes
            errors.add(:picture, "should be less than 5MB")
        end
    end
end

