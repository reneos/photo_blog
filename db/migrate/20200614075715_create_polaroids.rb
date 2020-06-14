class CreatePolaroids < ActiveRecord::Migration[6.0]
  def change
    create_table :polaroids do |t|

      t.timestamps
    end
  end
end
