class ApplicationPolicy
  attr_reader :current_user, :record

  def initialize(user, record)
    @current_user = current_user
    @record = record
  end

  # Anyone who is part of Devgroup
  def superuser?
    return false if current_user.blank?

    current_user.superuser?
  end

  def hr_access?
    return false if current_user.blank?

    superuser? || current_user.hr_access?
  end

  def uh_employee?
    current_user.employed_by_unmh?
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
