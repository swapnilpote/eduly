class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :super_admin, default: false

      t.timestamps null: false
    end
  end
end
