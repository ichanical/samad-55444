class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.text :message
      t.string :from_mobile
      t.string :to_mobile
      t.timestamps
    end
  end
end
