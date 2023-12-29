class AddPasswordToParticipants < ActiveRecord::Migration[7.1]
  def change
    add_column :participants, :password, :string
  end
end
