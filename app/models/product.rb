class Product < ApplicationRecord

  after_create :send_notification

  has_one_attached :product_image

  validates :name, presence: true, length: { minimum: 2, maximum: 15 }
  validates :description, presence: true, length: { minimum: 100, maximum: 250 }
  validates :quantity, presence: true, numericality: { grater_than_or_equals: 0, less_than: 100 }
  validates :price, presence: true, numericality: { grater_than: 0 }
  validate :name_start_with_a

  def name_start_with_a
    if !self.name.start_with?('A')
      errors.add(:name,"A harfi ile başlamalı")
    end
  end


  def send_notification
    p 'Bütün kullanıcılara yeni ürün eklendiğine dair bildirim veya mail gönder'
  end
end
