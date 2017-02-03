class CreateVictimsTable < ActiveRecord::Migration[5.0]

  def up
    create_table :victims do |t|
      t.string :name
      t.belongs_to :weapon, :foreign_key => 'weapons.id'
    end
  end

  def down
    drop_table :victims
  end

end
