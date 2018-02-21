class Product < ApplicationRecord
  belongs_to :user
  default_scope -> { order(id: :desc) }
  validates :user_id, presence: true
  validates :name,  presence: true,
                    length: { minimum: 5 }
end
