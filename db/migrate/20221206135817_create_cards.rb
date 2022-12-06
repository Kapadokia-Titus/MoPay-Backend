class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string  :card_name
      t.string  :card_number
      t.string  :expiration
      t.string  :card_bank
      t.string  :cvv
      t.integer :user_id
      t.string  :amount
      t.timestamps
    end
  end
end
