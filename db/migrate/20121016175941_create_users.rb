class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mobile 
      t.string :crypted_password  
      t.string :password_salt  
      t.string :persistence_token  
      t.string :perishable_token  
      t.timestamps
      
    end
  end
end
