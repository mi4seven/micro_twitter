class FollowersController < ApplicationController
  before_action :set_follower, only: [:show, :edit, :update, :destroy]
  
  def update
    @new_follower = Follower.new
    @new_follower.user_id = @follower.follower_id     
    @new_follower.follower_id = current_user.id
  
    @new_follower.save 
    
    redirect_back(fallback_location: root_path)
  end

  def create
      # @follower = Follower.new(follower_params)
      # @follower.follower_id = params[:follower_id]
    
      # @follower.save
  end

  def destroy
    @follower.destroy
    redirect_back(fallback_location: root_path)
  end  

  # Use callbacks to share common setup or constraints between actions.
  def set_follower
    @follower = Follower.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def follower_params
    params.require(:follower).permit(:follower)
  end
end
