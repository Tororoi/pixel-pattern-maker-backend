class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar

  has_many :patterns, serializer: PatternSerializer

  has_many :favorites, serializer: FavoriteSerializer
end
