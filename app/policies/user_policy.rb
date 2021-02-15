class UserPolicy < ApplicationPolicy
  def impersonate?
    superuser?
  end

  def edit_access?
    current_user.admin? && current_user.id != record.id
  end

end
