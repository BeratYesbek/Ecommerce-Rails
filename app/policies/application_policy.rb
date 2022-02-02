# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record,:role_result

  def initialize(user, record,role_result = false)
    @user = user
    @record = record
    @role_result = role_result
  end

  def index?
    role_result
  end

  def show?
    role_result
  end

  def create?
    role_result
  end

  def new?
    create?
  end

  def update?
    role_result
  end

  def edit?
    update?
  end

  def destroy?
    role_result
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
