# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.destroy_all
Author.destroy_all
Genre.destroy_all
f = File.open('/Users/Dino/Desktop/dataset.txt')

f.each_line do |line|
  puts "------"
  info = []
  info_raw = line.strip.split(',')
  info_raw.each do |item|
    if item[0] == '"'
      item += info_raw.delete_at(1)
      item = item.chomp('"').reverse.chomp('"').reverse
    end
    info.push(item)
  end
  book = Book.create({:title => info[0], :year => info[2], :sales => info[6]})
  name = info[1].split
  author = Author.create({:last_name => name[0], :first_name => name[1]})
  genre = Genre.create({:genre => info[3]},{:genre => info[4]})
  ab = AuthorsBooks.create({:book_id => book.id, :author_id => author.id})
  ag = AuthorsGenres.create({:author_id => author.id, :genre_id => genre.id})
  bg = BooksGenres.create({:genre_id => genre.id, :book_id => book.id})
  
  p ab
  p ag
  p bg
  
  #p info
end









# Naslov,Avtor,Leto,Žanr 1,Žanr 2,Prodaja
