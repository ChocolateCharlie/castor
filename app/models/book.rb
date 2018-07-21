class Book < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: {
    message: "Le titre doit être renseigné."
  }

  validates :title, uniqueness: {
    message: "Ce titre figure déjà dans la liste."
  }

  scope :french, -> { where(category_id: 1) }
  scope :world, -> { where(category_id: 2) }
  scope :england -> {where(category_id: 3) }
end
