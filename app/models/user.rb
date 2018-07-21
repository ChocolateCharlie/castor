class User < ActiveRecord::Base

  def admin?
    self.role == "admin"
  end

  validates :name, presence: {
    message: "Le nom doit être renseigné."
  }

  validates :name, uniqueness: {
    message: "Ce nom est déjà pris."
  }

  validates :password, presence: {
    message: "Le mot de passe doit être renseigné."
  }

  scope :admin, -> { where(role: "admin") }
  scope :user, -> { where(role: "user") }
end
