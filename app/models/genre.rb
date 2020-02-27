class Genre < ApplicationRecord
  belongs_to :songs
  has_many :artists, through: :songs
end
