class AddPasswordDigestToParticipants < ActiveRecord::Migration[7.1]
  def change
    add_column :participants, :password_digest, :string
  end
end
