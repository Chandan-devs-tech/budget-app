class CreateCategoryTransac < ActiveRecord::Migration[7.0]
  def change
    create_table :category_transacs do |t|
      t.references :category, null: false, foreign_key: true
      t.references :transac, null: false, foreign_key: true

      t.timestamps
    end
  end
end
