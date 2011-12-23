class HomeController < ApplicationController
  def index
    @authors  = Author.all
    @avrage  = Author.all.count / Genre.all.count
  end
  
  def genre
    @genres = Genre.all
    @avrage  = Book.all.count.to_f / Genre.all.count.to_f 
  end
  
  def sales
    @genres = Genre.sales
  end
  def sub_sales
    @genres = Genre.sub_sales
  end
  
  def genre_chart
    @genres = Genre.where("level = ?",1)
    @normal = Book.sum("sales")
  end
  
  def top_chart
    @normal = Book.sum("sales")
    @genres = Genre.where("level = ?",1)
    @books = []
    @genres.each do |genre|
      genre.books.each do |book|
        @books.push(book)
      end
    end
  end
  
end
