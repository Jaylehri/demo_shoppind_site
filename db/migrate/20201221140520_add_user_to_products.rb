class AddUserToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :user,  foreign_key: true
    add_foreign_key :products, :users
  end
end
