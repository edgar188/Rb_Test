class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :user, null: false, default: nil, foreign_key: { on_delete: :cascade }
      t.text :url, null: true, default: nil
      
      t.timestamps
    end
  end
end
