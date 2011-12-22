class HomeController < ApplicationController
  def index
    @authors  = Author.all
    @avrage  = Author.all.count / Genre.all.count
  end
  
  def genre
    @genres = Genre.all
    @avrage  = Genre.all.count.to_f / Book.all.count.to_f
  end
  
  def sales
    @genres = Genre.sales
  end
  
end
