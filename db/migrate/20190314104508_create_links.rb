class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :original, null: false
      t.string :shortened

      t.timestamps
    end
  end
end
