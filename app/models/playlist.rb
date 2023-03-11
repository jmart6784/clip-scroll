class Playlist < ApplicationRecord
  belongs_to :user
  validates :name, :type, :private, :user_id, presence: true
end
