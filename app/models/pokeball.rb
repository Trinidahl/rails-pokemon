class Pokeball < ApplicationRecord
  belongs_to :trainer
  belongs_to :pokemon

  validates :caught_on, presence: true
end
