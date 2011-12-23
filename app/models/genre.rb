class Genre < ActiveRecord::Base
  has_and_belongs_to_many :books
  has_and_belongs_to_many :authors
  
  attr_accessor :sales
  attr_accessor :sub_genres
  
  def self.sales(params = 1)
    @genres = self.where("level = ?",params)
    @genres.each do |genre|
      sales = 0
      genre.books.each do |book|
        sales += book.sales
      end
      genre.sales = sales
    end
  end
  
  def self.sub_sales
    @genres = self.where("level = ?",1)
    @genres.each do |genre|  
      genre.sub_genres = []
      genre.books.each do |book|
        sub_g = book.genres.where("level = ?", 2).first
        sales = 0
        sub_g.books.each do |sub_book|
          sales += sub_book.sales
        end
        sub_g.sales = sales
        genre.sub_genres.push(sub_g)
      end
      genre.sub_genres = genre.sub_genres.uniq
    end
  end

end
