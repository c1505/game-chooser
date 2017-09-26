class Collection < ApplicationRecord
  has_many :games
  belongs_to :user
end
