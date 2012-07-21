class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :original
      t.string :short
      t.string :vanity

      t.timestamps
    end
  end
end
