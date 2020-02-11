class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first
      t.string :last
      t.string :role

      t.timestamps
    end
  end
end
