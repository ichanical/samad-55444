class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      
      t.integer :user_id
      t.string :mobile
      t.string :code
    
    end
  end
end
