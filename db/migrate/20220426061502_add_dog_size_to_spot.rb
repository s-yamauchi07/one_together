class AddDogSizeToSpot < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :dog_size_id, :integer, null: false
  end
end
