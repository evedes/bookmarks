class Bookmark < ApplicationRecord
  validates :name, presence: true
end
