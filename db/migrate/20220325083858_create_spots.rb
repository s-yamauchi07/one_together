class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string  :name,              null: false
      t.string  :phone_number,      null: false
      t.string  :website,           null: false
      t.string  :address,           null: false
      t.float   :latitude,          null: false
      t.float   :longitude,         null: false
      t.integer :prefecture_id,     null: false  
      t.integer :spot_type_id,      null: false
      t.integer :dog_permission_id, null: false
      t.text    :comment,          null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
