class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :description
      t.integer :credit_account_id
      t.integer :debit_account_id
      t.decimal :amount
      t.timestamps
    end
    add_index :transactions, :credit_account_id
		add_index :transactions, :debit_account_id
  end

  def self.down
    drop_table :transactions
  end
end

