class Genre < ActiveRecord::Base
  has_and_belongs_to_many :books
  has_and_belongs_to_many :authors
  
  attr_accessor :sales
  
  def self.sales
    @genres = self.all
    @genres.each do |genre|
      sales = 0
      genre.books.each do |book|
        sales += book.sales
      end
      genre.sales = sales
      puts "#{genre.genre} - #{genre.sales}"
    end
  end
  
end
