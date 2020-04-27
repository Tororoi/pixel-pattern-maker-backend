# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Color.destroy_all
Palette.destroy_all

Color.create(hex: "#e1ffe4")
Color.create(hex: "#1e0f46")
Color.create(hex: "#eaadbd")
Color.create(hex: "#ffa751")
Color.create(hex: "#000071")
Color.create(hex: "#c289f2")
Color.create(hex: "#c0b7ff")
Color.create(hex: "#00008e")

seedPalette = Palette.create(pattern_id: 1)

seedPalette.colors.create(hex: "#e1ffe4")
seedPalette.colors.create(hex: "#1e0f46")
seedPalette.colors.create(hex: "#eaadbd")
seedPalette.colors.create(hex: "#ffa751")
seedPalette.colors.create(hex: "#000071")
seedPalette.colors.create(hex: "#c289f2")