class AddIndicesToLinks < ActiveRecord::Migration[5.2]
  def change
    add_index :links, :original
    add_index :links, :shortened
  end
end
