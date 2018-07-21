class Book < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: {
    message: "Le titre doit être renseigné."
  }

  validates :title, uniqueness: {
    message: "Ce titre figure déjà dans la liste."
  }
end
