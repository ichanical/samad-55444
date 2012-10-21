class Contact < ActiveRecord::Base
   attr_accessible :mobile, :user_id,:code
   belongs_to :user
   
end
