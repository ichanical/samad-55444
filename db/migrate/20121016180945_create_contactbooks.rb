class CreateContactbooks < ActiveRecord::Migration
  def change
    create_table :contactbooks do |t|
      t.integer :user_id
      t.string :mobile
      t.string :code
    end
  end
end
