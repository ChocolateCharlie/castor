class Category < ActiveRecord::Base
  has_many :books

  validates :name, uniqueness: {
    message: "Cette catégorie existe déjà."
  }
end
