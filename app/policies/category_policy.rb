class CategoryPolicy < AdminPolicy


  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
