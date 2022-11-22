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
  end
end
