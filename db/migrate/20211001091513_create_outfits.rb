class CreateOutfits < ActiveRecord::Migration[5.2]
  def change
    create_table :outfits do |t|
      t.string :title,                            null: false
      t.text :content
      t.references :proposer, foreign_key: true,  null: false

      t.timestamps
    end
  end
end
