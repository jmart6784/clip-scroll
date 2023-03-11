class Playlist < ApplicationRecord
  belongs_to :user
  
  validates :name, :source, :user_id, presence: true
  validates :private, inclusion: { in: [ true, false ] }
  validates :source, inclusion: { in: [ "youtube", "reddit", "mix" ] }
  validates :name, length: {minimum: 1, maximum: 50}
end