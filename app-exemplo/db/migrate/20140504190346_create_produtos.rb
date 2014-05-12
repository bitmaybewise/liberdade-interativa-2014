class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :codigo
      t.string :nome
      t.string :status
      t.decimal :valor
      t.belongs_to :categoria

      t.timestamps
    end
  end
end
