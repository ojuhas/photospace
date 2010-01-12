class CreateKategorias < ActiveRecord::Migration
  def self.up
    create_table :kategorias do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :kategorias
  end
end
