class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by_id(params[:id])
    if @project.blank?
      render plain: 'Not Found :(', status: :not_found
    end
  end



  def self.initialize
      @api_key = "34ea9f2f4846a435ad387c86d9da5ba9"
      @api_base_url = "https://api.openweathermap.org/data/2.5/weather?"
    end

    def self.get_weather(zip)
      response = RestClient.get("#{@api_base_url}zip=#{zip},us&appid=#{@api_key}")
      JSON.parse(response)['weather'][0]['description']

    end

    def self.get_temp(zip)
      response = RestClient.get("#{@api_base_url}zip=#{zip},us&appid=#{@api_key}")
      data = JSON.parse(response)['main']['temp']
      data = ((data - 273.15) * (9/5)) + 32

    end
end
