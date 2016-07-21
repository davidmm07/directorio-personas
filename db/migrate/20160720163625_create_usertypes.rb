class CreateUsertypes < ActiveRecord::Migration[5.0]
  def change
    create_table :usertypes do |t|
      t.string :nombre_tipo_usuario

      t.timestamps
    end
  end
end

#timestamps fecha y hora en la que se almacenan los registros
