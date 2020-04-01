require 'net/http'
require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'

require './models/total'
require './models/country'
require './models/news'
require './models/asset'

get '/' do
  content_type :json
  @data = { assets: Asset.last }.to_json # total: Total.last, news: News.last, assets: Asset.last
  @data.delete! '\\'
  @data
end


def get_total_covid_stats
  response = Net::HTTP.get_response('coronavirus-19-api.herokuapp.com', '/all')
  if response.code == '200'
    @total = Total.new
    p 'total here'
    p @total
    @total.data = response.body
    p @total.data
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
  uri = URI("http://newsapi.org/v2/top-headlines?q=covid&language=en&apiKey=e6a54260a8e0419ebbfddaa48b5c5a1c")
  response = Net::HTTP.get_response(uri)
  if response.code == '200'
    @news = News.new
    @news.data = response.body
    @news.save
  end
end

def get_asset_data
  get_spy_1y_data
end

def get_spy_1y_data
  p 'nothing here yet'
  # For now we are just doing 1y data so save the info to -> asset.spy1y
  @asset = Asset.new
  @asset.spy1y = "add the response body on success"
  @asset.save
end


get '/generate' do
  get_total_covid_stats
  get_country_covid_stats
  get_global_news
  get_asset_data
end