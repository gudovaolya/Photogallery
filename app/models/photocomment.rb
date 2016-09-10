class Photocomment < ApplicationRecord
  belongs_to :photo
  belongs_to :user
  validates :content, presence: true, length: {maximum: 300}
  validates :score, presence: true,
            numericality: { greater_than: 0, less_than: 6 }
end
