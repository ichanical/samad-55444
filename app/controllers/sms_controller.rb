class SmsController < ApplicationController
  
  def main
    @msg=params[:message]
    @mobile_number=params[:mobile]
    @splitted_msg=@msg.split(/\W+/)
    case @splitted_msg[0].downcase
    when "register"
        pass=rand(100000.999999)
        @user=User.new
        @user.mobile=params[:mobile]
        @user.password=pass
        @user.password_confirmation=pass
        @user.save
        @message="your password is #{pass}"
    when "send"
        @sms=Sms.new
        @sms.from=params[:mobile]
        @sms.to=@splitted_msg[1]
#        Digest::MD5.hexdigest('foobar')
        @sms.message=@splitted_msg[2]
        @sms.save
    end
    render :text => "text to render..."
  end

end
