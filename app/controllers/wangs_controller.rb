class WangsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def new
    respond_with Wang.factory
  end

  def show
    respond_with Wang.find_or_initialize_by_token(params[:id])
  end

  def update
    wang = Wang.find_or_initialize_by_token(params[:id])
    json = JSON.parse(request.body.read)
    wang.javascript = json['javascript']
    wang.templates = json['templates'].to_json
    wang.save!
    head :ok
  end
end
