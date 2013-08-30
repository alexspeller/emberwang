class WangsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def new
    wang = Wang.factory
    if session[:email].present?
      wang.email = session[:email]
    end
    respond_with wang
  end

  def show
    respond_with Wang.find_or_initialize_by_token(params[:id])
  end

  def update
    wang = Wang.find_or_initialize_by_token(params[:id])
    json = JSON.parse(request.body.read)
    wang.javascript = json['javascript']
    wang.script_language = json['script_language']
    wang.templates = json['templates'].to_json
    if wang.new_record? && session[:email].present?
      wang.email = session[:email]
    end
    wang.save!
    head :ok
  end
end
