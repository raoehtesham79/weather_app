require 'httparty'
class WeatherController < ApplicationController
  def index
  end

  def show
    city_name = params[:city]

    url = URI("https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&APPID=#{ENV['OPEN_WEATHER_API_KEY']}")
    response = HTTParty.get(url)
    data = JSON.parse(response.body)
    binding.pry
    if data['cod'] == 200
      @weather = {
        city: data['name'],
        temperature: data['main']['temp'],
        conditions: data['weather'].first['description'],
        winds: data['wind'],
        clouds: data['clouds']
      }
    else
      flash.now[:alert] = 'City not found'
    end

    render 'show'
  end
end
