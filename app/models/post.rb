class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories

  def self.search(search)
    where('title ILIKE ? OR plain_text ILIKE ?', "%#{search}%", "%#{search}%")
  end
end
