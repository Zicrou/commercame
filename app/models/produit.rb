class Produit < ApplicationRecord
    validates :name, :quantity, :price, presence: true

    has_many :ventes, dependent: :destroy
end
