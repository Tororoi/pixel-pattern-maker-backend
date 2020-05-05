class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :pattern

  has_one :pattern, serializer: PatternSerializer
end
