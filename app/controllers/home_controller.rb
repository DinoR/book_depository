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
  
  def matrix_r
    @matrix = []
    @years_range =  Array(Book.where('year != 0').minimum("year")..Book.maximum("year"))
    @years_range.unshift(0)
    #@matrix.push(@years_range)
    @genres = Genre.where("level = ?",1)
    @genres.each do |genre|
      genre_sales = [genre.genre]
      @years_range.each do |year|
        genre_sales.push(genre.books.where("year = #{year}").sum('sales'))
      end
      @matrix.push(genre_sales)
    end
    
    @sales_count = ['Vsota']
    @years_range.each_with_index do |year, index|
      sales = 0
      @matrix.each do |genre|
        sales += genre[index + 1]
      end
      @sales_count.push(sales)
    end

    #@matrix.unshift(@years_range)
    #@matrix.push(@sales_count)
    
    
    
  end
  
end
