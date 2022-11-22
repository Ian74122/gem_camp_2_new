class TopUpsController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.amount = params[:order][:amount]
    @order.user = current_user
    @order.save
    # call third party get a url
    # build callback api
    # start your server by ngrok
    # waiting server callback (info bernard & tell serial number to paid)
  end
end
