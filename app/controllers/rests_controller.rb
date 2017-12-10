class RestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def login # enviar los datos al ws2
    image_data = Base64.encode64(File.open(params[:user]["image"].tempfile, "rb").read)
    params[:user]["image"] = image_data
    result = Net::HTTP.post_form(URI.parse('http://localhost:5000/rest/verify_user'), params[:user])
    redirect_to action: "result", message: result.message 
  end

  def requester
  end

  def result
  end
end
