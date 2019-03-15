class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.inet 'ip', null: false
      t.references :link
      t.timestamps
    end
  end
end
