class ProductPolicy < AdminPolicy
  
  def index?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
