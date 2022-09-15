class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
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

def update
  @user = User.find(params[:id])
  if @user.update(params_user)
    flash[:notice] = "Your account information was updated succesfully"
    redirect_to articles_path
  else
    render 'edit'
  end
end

def destroy

  @user.destroy
  flash[:notice] = "User deleted succesfully"
  redirect_to articles_path
end
private

  def params_user
    params.require(:user).permit(:username,:email,:password)
  end

end
