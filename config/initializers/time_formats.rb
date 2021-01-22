
# Created to format dates and times consistently throughout the app.
# Date formats:
Time::DATE_FORMATS[:date4yr] = "%m/%d/%Y"               # time.to_s(:date4yr)      ---->  01/29/2021
Time::DATE_FORMATS[:date2yr] = "%m/%d/%Y"               # time.to_s(:date2yr)      ---->  01/29/21
Time::DATE_FORMATS[:fancy] = "%A, %d %b %Y"             # time.to_s(:fancy)        ---->  Friday, 29 Jan 2021
Time::DATE_FORMATS[:datetime] = "%m/%d/%y %H:%M"        # time.to_s(:datetime)     ---->  01/29/21 00:30
Time::DATE_FORMATS[:timedate] = "%H:%M %m/%d/%y"        # time.to_s(:timedate)     ---->  00:30 01/29/21

# Time formats:
Time::DATE_FORMATS[:military] = "%H:%M"              # time.to_s(:military)  ---->  15:30
Time::DATE_FORMATS[:twelvehr] = "%l:%M %p"           # time.to_s(:twelvehr)  ---->  12:30 AM
