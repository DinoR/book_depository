Book.destroy_all
Author.destroy_all
Genre.destroy_all
f = File.open('/Users/Dino/Desktop/dataset_6_A.csv')

f.each_line do |line|
  puts "======================"
  #====================>  Razcep
  info = []
  info_raw = line.strip.split(',')
  info_raw.each do |item|
    if item[0] == '"'
      item += info_raw.delete_at(1)
      item = item.chomp('"').reverse.chomp('"').reverse
    end
    info.push(item)
  end
  #====================>  Knjiga
  book = Book.create({:title => info[0], :year => info[2], :sales => info[5]})
  p "Knjiga: #{book.title}"
  #====================>  Avtor
  if Author.where("name = ?", info[1]).count != 0 
    author = Author.where("name = ?", info[1]).first
  else
    author = Author.create({:name => info[1]})
  end
  p "Avtor: #{author.name}"
  #====================>  Zanr 1
  if Genre.where("genre = ?", info[3]).count != 0
    genre = Genre.where("genre = ?", info[3]).first
  else
    genre = Genre.create({:genre => info[3], :level => 1})
  end
  p "zanr: #{genre.genre}"
  #====================>  Povezovalne tabele
  ag = AuthorsGenres.create({:author_id => author.id, :genre_id => genre.id})
  bg = BooksGenres.create({:genre_id => genre.id, :book_id => book.id})
  #====================>  Zanr 2
  if Genre.where("genre = ?", info[4]).count != 0
    genre = Genre.where("genre = ?", info[4]).first
  else
    genre = Genre.create({:genre => info[4], :level => 2})
  end
  p "zanr: #{genre.genre}"
  #====================>  Povezovalne tabele
  ag = AuthorsGenres.create({:author_id => author.id, :genre_id => genre.id})
  bg = BooksGenres.create({:genre_id => genre.id, :book_id => book.id})
  ab = AuthorsBooks.create({:book_id => book.id, :author_id => author.id})

end