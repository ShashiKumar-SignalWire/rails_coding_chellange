class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :tag
      t.belongs_to :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
