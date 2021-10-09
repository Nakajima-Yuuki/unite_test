class StocksController < ApplicationController
  before_action :authenticate_user!
    def create
        stock = current_user.stocks.create(outfit_id: params[:outfit_id])
        redirect_to outfit_path(params[:outfit_id]), notice: "#{stock.outfit.proposer.username}さんのブログをお気に入り登録しました"
      end
      def destroy
        
        stock = current_user.stocks.find_by(id: params[:id]).destroy
        redirect_to outfit_path(stock.outfit_id), notice: "#{stock.outfit.proposer.username}さんのブログをお気に入り解除しました"
      end
    end
