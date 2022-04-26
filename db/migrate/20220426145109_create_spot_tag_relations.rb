class CreateSpotTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :spot_tag_relations do |t|
      t.references :spot, foreign_key: true
      t.references :tag,  foreign_key: true
      t.timestamps
    end
  end
end
