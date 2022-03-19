# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  price       :float
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Product < ApplicationRecord

  after_create :send_notification

  has_one_attached :product_image

  belongs_to :category

  validates :name, presence: true, length: { minimum: 2, maximum: 15 }
  validates :description, presence: true, length: { minimum: 100, maximum: 500 }
  validates :quantity, presence: true, numericality: { grater_than_or_equals: 0, less_than: 100 }
  validates :price, presence: true, numericality: { grater_than: 0 }
  validate :name_start_with_a

  after_save :delete_product_after_30days

  def delete_product_after_30days
    #45 => 
    ProductJob.set(wait: 1.minutes).perform_later(self)
  end

  def name_start_with_a
    if !self.name.start_with?('A')
      errors.add(:name,"A harfi ile başlamalı")
    end
  end


  def send_notification
    p 'Bütün kullanıcılara yeni ürün eklendiğine dair bildirim veya mail gönder'
  end
end
