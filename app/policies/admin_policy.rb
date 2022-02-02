class AdminPolicy < ApplicationPolicy

  def initialize(user,record)
    super(user,record, (user.present? && (user.superadmin? ||user.admin?)))
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
