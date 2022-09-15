class UsersController < ApplicationController

  def new
    @user = User.new
  end

 def create
   @user = User.new(params_user)
   if @user.save
     flash[:notice] = "Welcome to the Alpha Blog, you have succefully Sign Up"
     redirect_to articles_path
   else
     render 'new'
 end
end

private

  def params_user
    params.require(:user).permit(:username,:email,:password)
  end

end
