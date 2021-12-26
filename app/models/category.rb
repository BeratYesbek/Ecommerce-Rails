class Category < ApplicationRecord

  after_save :after_saved_method
  before_save :before_saved_method
  before_destroy :before_destroy
  after_update :after_update
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
