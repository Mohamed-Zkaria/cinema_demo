class Review < ApplicationRecord
    validates :title, presence: true
    validates :user, presence: true, length: { minimum: 3 } 
    validates :stars, presence: true, length: {minimum: 0, maximum: 5}
    validates :review, presence: true
end
