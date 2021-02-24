# frozen_string_literal: true

# Created to format dates and times consistently throughout the app.
# Date formats:
Time::DATE_FORMATS[:date4yr]  = "%m/%d/%Y"          # DateTime.to_s(:date4yr)      ---->  01/29/2021
Time::DATE_FORMATS[:date2yr]  = "%m/%d/%y"          # DateTime.to_s(:date2yr)      ---->  01/29/21
Time::DATE_FORMATS[:fancy]    = "%A, %b %d, %Y"      # DateTime.to_s(:fancy)        ---->  Friday, Jan 29, 2021
Time::DATE_FORMATS[:datetime] = "%m/%d/%y %H:%M"    # DateTime.to_s(:datetime)     ---->  01/29/21 00:30
Time::DATE_FORMATS[:timedate] = "%H:%M %m/%d/%y"    # DateTime.to_s(:timedate)     ---->  00:30 01/29/21
# For the Oracle db dates from HR Payroll
Date::DATE_FORMATS[:date4yr]  = "%m/%d/%Y"          # DateTime.to_s(:date4yr)      ---->  01/29/2021
Date::DATE_FORMATS[:date2yr]  = "%m/%d/%y"          # DateTime.to_s(:date2yr)      ---->  01/29/21
# Time formats:
Time::DATE_FORMATS[:military] = "%H:%M"             # DateTime.to_s(:military)     ---->  00:30
Time::DATE_FORMATS[:twelvehr] = "%l:%M %p"          # DateTime.to_s(:twelvehr)     ---->  12:30 AM
