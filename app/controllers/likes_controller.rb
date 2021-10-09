class LikesController < ApplicationController
    #before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）
    before_action :outfit_params
    def create
      Like.create(user_id: current_user.id, outfit_id: params[:id])
        
      end
    
    def destroy
      Like.find_by(user_id: current_user.id, outfit_id: params[:id]).destroy
        
    end
    
    private 
      
    def outfit_params
      @outfit = Outfit.find(params[:id])
    end

    
end
