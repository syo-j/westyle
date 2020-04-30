require "csv"

# SeedFu.quiet = true

# CSV.foreach('db/fixtures/seed_bland.csv') do |row|
#   Bland.seed(:initial, :name) do |s|
#     s.initial = row[0]
#     s.name = row[1]
#   end
# end
# n = 1
# CSV.foreach('db/fixtures/seed_categorie.csv') do |row|
#   Category.seed(:name) do |s|
#     s.name = row[0]
#   end
#   Category.create(item: File.open("./app/assets/images/cate#{n}.png"))
#   n ++
# end


Category.create!(name: 'トップス', item: File.open("./app/assets/images/cate1.png"))
Category.create!(name: 'ボトムス', item: File.open("./app/assets/images/cate2.png"))
Category.create!(name: 'シューズ', item: File.open("./app/assets/images/cate3.png"))
Category.create!(name: 'キャップ', item: File.open("./app/assets/images/cate4.png"))
Category.create!(name: 'アクセサリー', item: File.open("./app/assets/images/cate5.png"))
Category.create!(name: 'バッグ', item: File.open("./app/assets/images/cate6.png"))
Category.create!(name: 'その他', item: File.open("./app/assets/images/cate7.png"))

CSV.foreach('db/fixtures/seed_color.csv') do |row|
  Color.seed(:name, :css_color) do |s|
    s.name = row[0]
    s.css_color = row[1]
  end
end

CSV.foreach('db/fixtures/seed_size.csv') do |row|
  Size.seed(:name) do |s|
    s.name = row[0]
  end
end

CSV.foreach('db/fixtures/seed_area.csv') do |row|
  Area.seed(:prefecture) do |s|
    s.prefecture = row[0]
  end
end
