class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:edit, :update]

  def update
    #@user_profile.image.attach(params[:image])       
    @user_profile.update(user_profile_params)
 
    flash.notice = "Your profile has been successfully updated!"
    #render action: "edit"
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = UserProfile.find(params[:id])  
    end

    def user_profile_params
      #@params.require(:user_profile).permit(:user_profile)
      params[:user_profile][:user_id] = current_user.id
      params.require(:user_profile).permit(:name, :username, :image)
    end      

end
