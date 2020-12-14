class UsersController < ApplicationController
  before_action :set_user, only: [:update]
  
   def update
     follow   
     redirect_back(fallback_location: root_path)
   end

  def destroy
  end  

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end


private

  def follow  
    @new_follower = Follower.new
    @new_follower.user_id = @user.id     
    @new_follower.follower_id = current_user.id

    @new_follower.save 
  end


  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:user)
  end 

end
