class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nombres
      t.string :apellidos
      t.string :telefonos
      t.string :email, null: false
      t.references :usertype, index: true, foreign_key: true

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
