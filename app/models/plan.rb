class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to    :category
  belongs_to    :timezone
  belongs_to    :season

  
  belongs_to    :user
  has_many      :comments
  has_many      :likes
  has_one_attached :image

  
  validates :category_id, numericality: { other_than: 1 } 
  validates :concept, presence: true, unless: :was_attached?
  
  def was_attached?
    self.image.attached?
  end
end
