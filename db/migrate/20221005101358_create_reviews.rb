class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :listing, null: false, default: nil, foreign_key: { on_delete: :cascade }
      t.bigint :external_id, null: false, default: nil
      t.string :reviewer_name, null: false, default: nil
      t.text :text, null: true, default: nil
      t.date :date, null: true, default: nil

      t.timestamps
    end
  end
end
