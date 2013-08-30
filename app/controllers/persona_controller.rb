require 'net/http'

class PersonaController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def login
    url = URI "https://verifier.login.persona.org/verify"
    response = Net::HTTP.post_form url, assertion: params[:assertion], audience: "http://localhost:3000"
    if response.code == "200"
      body = JSON.parse response.body
      session[:email] = body["email"]
      render json: {email: body["email"]}
      else
      head 401
    end


  end

  def logout
    reset_session!
    head :ok
  end
end
