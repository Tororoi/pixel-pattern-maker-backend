class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :pattern_id

  has_one :pattern, serializer: PatternSerializer
end
