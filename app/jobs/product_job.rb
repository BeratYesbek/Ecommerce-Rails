class ProductJob < ApplicationJob
  queue_as :default

  def perform(product)
    unless product.nil?

      product.delete
      puts "--> Product #{product.name} deleted"
    end
  end
end
