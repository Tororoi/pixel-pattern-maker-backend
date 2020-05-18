class Pattern < ApplicationRecord
  belongs_to :user

  has_many :palettes

  has_many :favorites

  def self.make (user, pattern, palette)
    # params = palette: {colors: ["hex", "hex"]}
    newPattern = user.patterns.create(pattern)
    newPalette = newPattern.palettes.create()
    newColors = palette[:colors].each { |color|
      newPalette.colors.find_or_create_by(hex: color) #implement find or create so you don't make colors that already exist.
    }
    return newPattern
  end
end
