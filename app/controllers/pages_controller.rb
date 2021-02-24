# frozen_string_literal: true

class PagesController < ApplicationController
  layout false, only: :noaccess
  # Skip before_action on the no access page
  # skip_before_action :get_user_perms?, only: :noaccess
  # skip_before_action :has_access?, only: :noaccess
  def welcome
  end

  def noaccess
  end
end
