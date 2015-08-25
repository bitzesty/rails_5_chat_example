class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.references :channel, index: true, foreign_key: true

      t.timestamps
    end
  end
end
