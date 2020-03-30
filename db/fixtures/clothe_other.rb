require "csv"

# SeedFu.quiet = true

CSV.foreach('db/fixtures/seed_bland.csv') do |row|
  Bland.seed(:initial, :name) do |s|
    s.initial = row[0]
    s.name = row[1]
  end
end

CSV.foreach('db/fixtures/seed_categorie.csv') do |row|
  Category.seed(:item, :name) do |s|
    s.item = row[0]
    s.name = row[1]
  end
end

CSV.foreach('db/fixtures/seed_color.csv') do |row|
  Color.seed(:name) do |s|
    s.name = row[0]
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
