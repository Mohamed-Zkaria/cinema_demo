class Movie < ApplicationRecord

    validates :title, presence: true, uniqueness: true, length: { minimum: 8 } 
    validates :description, presence: true, length: { minimum: 8 } 
    validates :year, presence: true
    validates :director, presence: true
    validates :actor, presence: true
    validates :filming_location, presence: true
    validates :country, presence: true

    has_many :reviews
end
