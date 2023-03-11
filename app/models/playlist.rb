class Playlist < ApplicationRecord
  validates :name, :type, :private, :user_id, presence: true
end
