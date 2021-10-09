class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def show
   # @user = current_user
    @user = User.find(params[:id])
    @stocks = Stock.all
    
   

  end
  
  
end
