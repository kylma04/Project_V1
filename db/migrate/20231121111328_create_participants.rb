class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.integer :age
      t.text :email, null: false
      t.integer :phone, null: false      
      t.timestamps
    end
  end
end
