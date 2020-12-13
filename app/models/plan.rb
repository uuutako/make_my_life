class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to    :category
  belongs_to    :timezone
  belongs_to    :season

  belongs_to    :user
  has_many      :comments
  has_one_attached :image

  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks, source: :user

  validates :category_id, numericality: { other_than: 1 } 
  validates :concept, presence: true, unless: :was_attached?
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  def was_attached?
    self.image.attached?
  end

end
