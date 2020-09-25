class CreatePlayerIndicators < ActiveRecord::Migration[6.0]
  def change
    create_table :player_indicators do |t|
      t.references :indicator, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
