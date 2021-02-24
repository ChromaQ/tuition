# frozen_string_literal: true

module UsersHelper

  def date_eligible(username)
    Employee.find_by_ldapid(username).pluck(:hire_date, :adjusted_hire_date)
  end
end

# Auto close requests: runs on August 15 yearly
# Auto approval (complex)
# check FTE Status: Regular status (active) and FTE between .5 and 1.
#   Check Hire Date: must be employed for at least 6 months (today - start_date <= 6 months)
#   Check Credit Hours for class (must be 1-4)
#   Check available Credit Hours
#   FTE .9 - 1,  24 max/fiscal year
#   FTE .7 - .8, 21 max/fiscal year
#   FTE .5 - .6, 18 max/fiscal year
#   Check course count per semester (Max of 4)
#   Check class is NOT a PE class
#       Check course start date is less than or equal to the date of request submit to manager
#       Check program id; if ‘0’ (manually entered) or is ’61’ (UNMH CAP Program), no auto-approval.
