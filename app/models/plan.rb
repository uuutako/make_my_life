class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to    :category
  
  belongs_to    :user
  has_many      :comments
  has_many      :likes
  has_one_attached :image

  validates :concept, presence: true, unless: :was_attached?
  validates :category_id, numericality: { other_than: 1 } 

  def was_attached?
    self.image.attached?
  end
end
