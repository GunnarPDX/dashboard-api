# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
require './app'

every 2.hours do
  get_total_covid_stats
  get_country_covid_stats
end

every 5.minutes do
  get_global_news
end

every 30.minute do
  p 'get news'
end