class Pattern < ApplicationRecord
  belongs_to :user

  has_many :palettes

  has_many :favorites
end
