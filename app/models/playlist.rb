class Playlist < ApplicationRecord
  belongs_to :user
  validates :name, :source, :private, :user_id, presence: true
end
