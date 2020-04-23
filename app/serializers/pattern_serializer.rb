class PatternSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :user_id, :creator, :num_faves 

  def creator
    self.object.user.username
  end

  def num_faves
    self.object.favorites.length
  end

  has_many :palettes, serializer: PaletteSerializer
end
