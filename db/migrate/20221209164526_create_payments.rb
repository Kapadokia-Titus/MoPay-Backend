class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string  :card_name
      t.string  :card_number
      t.string  :card_bank
      t.string  :amount 
      t.string  :status
      t.string  :receiver_email
      t.integer  :user_id
      t.integer  :card_id
      t.timestamps
    end
  end
end
