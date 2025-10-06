class CreateFilms < ActiveRecord::Migration[8.0]
  def change
    create_table :films do |t|
      t.string :titre
      t.integer :annee
      t.boolean :vu

      t.timestamps
    end
  end
end
