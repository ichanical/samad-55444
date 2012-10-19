class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create  
    @user = User.new(params[:user])
  
    if @user.save  
      #   flash[:notice] = "Registration successful. check email for activation" 
#      redirect_to new_restaurant_path and return
     redirect_to user_path(@user)
    else  
      render :action => 'new'  
    end  
  end 
  def show
    @user=User.find(params[:id])
    @messages=Sms.all(:conditions=>[:to=>@user.mobile])
  end
end
