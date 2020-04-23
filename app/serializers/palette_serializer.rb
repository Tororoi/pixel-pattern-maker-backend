class PaletteSerializer < ActiveModel::Serializer
  attributes :id, :colors

  def colors
    colors_array = self.object.colors

    colors_array.map {|c| c.hex}
  end
end
