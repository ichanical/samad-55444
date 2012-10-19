class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create  
    @user = User.new(params[:user])
    @user.mobile= Digest::MD5.hexdigest(params[:user][:mobile])
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
    @messages=Sms.where("to_mobile = ?",@user.mobile)
  end
end
