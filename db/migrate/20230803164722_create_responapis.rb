class CreateResponapis < ActiveRecord::Migration[7.0]
  def change
    create_table :responapis do |t|
      t.string :estado
      t.string :respuesta
      t.string :saldo

      t.timestamps
    end
  end
end
