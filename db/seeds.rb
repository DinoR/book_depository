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
  year = info[2]
  year = 0 if year == ""
  book = Book.create({:title => info[0], :year => year, :sales => info[5]})
  p "Knjiga: #{book.title}"
  #====================>  Avtor
  author_name = info[1]
  author_name = "N/A" if author_name == ""
  
  if Author.where("name = ?", author_name).count != 0 
    author = Author.where("name = ?", author_name).first
  else
    author = Author.create({:name => author_name})
  end
  p "Avtor: #{author.name}"
  #====================>  Zanr 1
  name = info[3]
  name = "N/A" if name == ""
  if Genre.where("genre = ?", name).count != 0
    genre = Genre.where("genre = ?", name).first
  else
    genre = Genre.create({:genre => name, :level => 1})
  end
  p "zanr: #{genre.genre}"
  #====================>  Povezovalne tabele
  ag = AuthorsGenres.create({:author_id => author.id, :genre_id => genre.id})
  bg = BooksGenres.create({:genre_id => genre.id, :book_id => book.id})
  #====================>  Zanr 2
  name = info[4]
  name = "N/A" if name == ""
  if Genre.where("genre = ?", name).count != 0
    genre = Genre.where("genre = ?", name).first
  else
    genre = Genre.create({:genre => name, :level => 2})
  end
  p "zanr: #{genre.genre}"
  #====================>  Povezovalne tabele
  ag = AuthorsGenres.create({:author_id => author.id, :genre_id => genre.id})
  bg = BooksGenres.create({:genre_id => genre.id, :book_id => book.id})
  ab = AuthorsBooks.create({:book_id => book.id, :author_id => author.id})

end