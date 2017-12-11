require 'net/http'
require "uri"

class RestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def login # enviar los datos al ws2
    image_data = Base64.encode64(File.open(params[:user]["image"].tempfile, "rb").read)
    params[:user]["image"] = image_data

    uri = URI.parse('https://tranquil-fjord-82118.herokuapp.com/rest/verify_user')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(params[:user])
    response = http.request(request)

    redirect_to action: "result", message: response.message 
  end

  def requester
  end

  def result
  end
end
