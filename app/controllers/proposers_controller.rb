class ProposersController < ApplicationController
  before_action :authenticate_proposer!


  def index
  end
  
  def show
    @proposer = Proposer.find(params[:id])
  end
end
