class User < ActiveRecord::Base
  attr_accessible :mobile , :password , :password_confirmation
  acts_as_authentic do |c|
      c.login_field = :mobile
  end
end
