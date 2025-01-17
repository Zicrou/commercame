class Reparation < ApplicationRecord
    validates :name, :probleme, :price, presence: true
end
