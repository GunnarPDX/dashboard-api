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
  @data = {
    stats: Total.last,
    news: News.last,
    assets: Asset.last,
    countries: Country.last
  }.to_json

  @data.delete! '\\'
  @data
end


def get_total_covid_stats
  response = Net::HTTP.get_response('coronavirus-19-api.herokuapp.com', '/all')
  if response.code == '200'
    @total = Total.last || Total.new
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
    @country = Country.last || Country.new
    @country.data = response.body
    @country.save
  end
end

def get_global_news
  uri = URI('http://newsapi.org/v2/top-headlines?q=covid&language=en&apiKey=e6a54260a8e0419ebbfddaa48b5c5a1c')
  response = Net::HTTP.get_response(uri)
  if response.code == '200'
    @news = News.last || News.new
    @news.data = response.body
    @news.save
  end
end

def get_asset_data
  @asset = Asset.last || Asset.new
  get_spy_1m_data(@asset)
  get_btc_1m(@asset)
  @asset.save
end


def get_spy_1m_data(asset)
  uri = URI('https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=SPY&apikey=EZIRZ2T7WKWHB3P0')
  response = Net::HTTP.get_response(uri)
  if response.code == '200'
    @asset.spy1m = response.body
  end
end

def get_btc_1m(asset)
  uri = URI('https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_MONTHLY&symbol=BTC&market=CNY&apikey=EZIRZ2T7WKWHB3P0')
  response = Net::HTTP.get_response(uri)
  if response.code == '200'
    @asset.btc1m = response.body
  end
end

__END__

get '/generate' do
  get_total_covid_stats
  get_country_covid_stats
  get_global_news
  get_asset_data
end


