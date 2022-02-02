# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord

  after_save :after_saved_method
  before_save :before_saved_method
  before_destroy :before_destroy
  after_update :after_update

  has_many :products


  def after_saved_method
    p 'after save çalıştı'
    #byebug
  end

  def before_saved_method
    p 'before save çalıştı'
    byebug
  end

  def after_update
    p 'after update çalıştı'
    byebug
  end

  def before_destroy
    p 'before destroy çalıştı'
    byebug
  end

end
