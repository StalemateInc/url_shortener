class AddCountryToVisits < ActiveRecord::Migration[5.2]
  def change
    add_reference :visits, :country, foreign_key: true
  end
end
