json.extract! produit, :id, :name, :quantity, :price, :image, :created_at, :updated_at
json.url produit_url(produit, format: :json)
