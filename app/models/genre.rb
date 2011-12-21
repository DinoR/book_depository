class Genre < ActiveRecord::Base
  has_and_belongs_to_many :books
  has_and_belongs_to_many :authors
end
