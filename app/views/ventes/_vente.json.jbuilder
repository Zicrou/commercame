json.extract! vente, :id, :quantity, :price, :produit_id, :created_at, :updated_at
json.url vente_url(vente, format: :json)
