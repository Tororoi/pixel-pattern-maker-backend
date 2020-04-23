class Color < ApplicationRecord
  has_many :palette_colors
  has_many :palettes, through: :palette_colors
end
