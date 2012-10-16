class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.text :message
      t.string :from
      t.string :to
      t.timestamps
    end
  end
end
