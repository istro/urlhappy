class AddClicksToLinks < ActiveRecord::Migration
  def change
    add_column :links, :clicks, :integer
  end
end
