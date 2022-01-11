json.product do
  json.id @product.id
  json.name @product.name
  json.description @product.description
  json.price @product.price
  json.quantity @product.quantity

  json.category @product.category

  if ((defined? @product.product_image) && (@product.product_image.filename != nil))
    json.product_image rails_blob_url(@product.product_image)
  end
end