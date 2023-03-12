class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :source, :private, :user_id, :created_at, :updated_at
  belongs_to :user
end
