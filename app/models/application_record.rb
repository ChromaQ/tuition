# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # # fiscal year credit calculations
  # def fiscalyear
  #   @fiscalyear ||= current_fiscalyear
  # end

  # To calculate the current fiscal year - uses HR Datashare_Hybrid calculation
  def current_fiscalyear
    date = DateTime.current
    if date.month >= 7
      (date.year.to_s[2, 2] + (date + 1.year).year.to_s[2, 2]).freeze
    else
      ((date - 1.year).year.to_s[2, 2] + date.year.to_s[2, 2]).freeze
    end
  end
end
