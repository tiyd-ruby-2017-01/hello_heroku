class CreateWeaponsTable < ActiveRecord::Migration[5.0]

  def up
    create_table :weapons do |t|
      t.string :name
      t.string :description
      t.string :kind
    end
  end

  def down
    drop_table :weapons
  end

end
