class CreateGonePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :gone_places do |t|
      t.references :user, null: false, foreign_key: true      
      t.references :spot, null: false, foreign_key: true
      t.timestamps
    end
  end
end
