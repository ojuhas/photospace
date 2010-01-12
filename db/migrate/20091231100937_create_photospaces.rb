class CreatePhotospaces < ActiveRecord::Migration
  def self.up
    create_table :photospaces do |t|
      t.string :autor
      t.text :komentarz
      t.integer :kategoria_id
      t.timestamps
    end
  end

  def self.down
    drop_table :photospaces
  end
end
