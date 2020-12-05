class Phrase < ApplicationRecord
  belongs_to :user
  
  validates :phrase, presence: true
  
end
