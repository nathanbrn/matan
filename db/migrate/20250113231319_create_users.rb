class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :description
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end