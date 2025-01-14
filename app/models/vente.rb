class Vente < ApplicationRecord
  validates :quantity, :price, presence: true
  belongs_to :produit
end
