class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :type
      t.boolean :contra

      t.timestamps
    end
    add_index :accounts, [:name, :type]
  end

  def self.down
    drop_table :accounts
  end
end

