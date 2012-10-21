class SmsController < ApplicationController
  
  def main
    @msg=params[:message]
    @mobile_number=params[:mobile]
    @splitted_msg=@msg.split(/\W+/)
    case @splitted_msg[0].downcase
    when "register"
        pass=rand(100000.999999)
        @user=User.find_by_mobile(params[:mobile])||User.new
        if @user.new_record?
        @user.mobile=params[:mobile]
        @user.password=pass
        @user.password_confirmation=pass
        @user.save
        @message="your password is #{pass}"
        else
         @message="already registered"

        end
    when "send"
        @sms=Sms.new
        @sms.from_mobile=params[:mobile]
        @sms.to_mobile=Digest::MD5.hexdigest(@splitted_msg[1])
#        Digest::MD5.hexdigest('foobar')
        @sms.message=@splitted_msg.last(@splitted_msg.count-2).join(" ")
        @sms.save
    when "snd"
        @sender=User.find_by_mobile(params[:mobile])
        if @sender.present?
            @sms=Sms.new
            @sms.from_mobile=params[:mobile]
            @sms.to_mobile=Contact.first(:conditions=>["user_id = ? AND code = ?",@sender.id,@splitted_msg[1]])
            @sms.message=@splitted_msg.last(@splitted_msg.count-2).join(" ")
            @sms.save
        else
          @message="First register using \n #samad register"
        end
    when "contact"
        @contact=Contact.new
        @contact.user=User.find_by_mobile(params[:mobile])
        @contact.code=@splitted_msg[1]
        @contact.mobile=Digest::MD5.hexdigest(@splitted_msg[2])
        @contact.save
        @message="Contact added with code #{@contact.code}"
    end
    render :text => @message||"text to render..."
  end

end
