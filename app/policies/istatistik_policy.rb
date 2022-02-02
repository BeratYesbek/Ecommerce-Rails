class IstatistikPolicy < AdminPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
