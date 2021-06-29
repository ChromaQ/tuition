# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # # fiscal year credit calculations
  # def fiscalyear
  #   @fiscalyear ||= current_fiscalyear
  # end

  # To calculate the current fiscal year - uses HR Datashare_Hybrid calculation
  def current_fiscalyear
    time = Time.current
    if time.month >= 7
      (time.year.to_s[2, 2] + (time + 1.year).year.to_s[2, 2]).freeze
    else
      ((time - 1.year).year.to_s[2, 2] + time.year.to_s[2, 2]).freeze
    end
  end
end
