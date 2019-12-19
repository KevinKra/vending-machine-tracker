class Snack < ApplicationRecord
  validates_presence_of :name, :cost

  has_many :machine_snacks
  has_many :machines, through: :machine_snacks
end