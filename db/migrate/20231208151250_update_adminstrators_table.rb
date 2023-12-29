class UpdateAdminstratorsTable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :administrators, :password, true
  end
end
