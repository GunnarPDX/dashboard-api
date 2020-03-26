require 'net/http'
require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'

require './models/model'

require './models/total'
require './models/country'
require './models/news'



get '/' do
  content_type :json
  @data = { total: Total.last }.to_json
  @data.delete! '\\'
  @data
end


def get_total_covid_stats
  response = Net::HTTP.get_response('coronavirus-19-api.herokuapp.com', '/all')
  if response.code == '200'
    @total = Total.new
    @total.data = response.body
    @total.save
  end
end

def get_country_covid_stats
  response = Net::HTTP.get_response('coronavirus-19-api.herokuapp.com', '/countries')
  if response.code == '200'
    @contry = Country.new
    @contry.data = response.body
    @contry.save
  end
end

def get_global_news
  # http://newsapi.org/v2/everything?q=bitcoin&from=2020-02-25&sortBy=publishedAt&apiKey=API_KEY
  p 'add api key'
end

get '/generate' do
  get_total_covid_stats
  get_country_covid_stats
  get_global_news
end