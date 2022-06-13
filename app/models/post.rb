class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: ["Fiction", "Non-Fiction"]

  validate :is_clickbaity

  private 

  def is_clickbaity
    unless title =~ /Won't Believe|Secret|Top \d+|Guess/
      errors.add(:title, "Must be clickbaity")
    end
  end
end
