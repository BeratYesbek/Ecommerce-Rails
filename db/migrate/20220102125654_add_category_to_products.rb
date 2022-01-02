class AddCategoryToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :category, null: false, foreign_key: true
  end
end
# belongs_to