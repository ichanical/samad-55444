class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create  
    @user = User.new(params[:user])
  
    if @user.save  
      #   flash[:notice] = "Registration successful. check email for activation" 
#      redirect_to new_restaurant_path and return
      raise @user.to_yaml
    else  
      render :action => 'new'  
    end  
  end 
end
