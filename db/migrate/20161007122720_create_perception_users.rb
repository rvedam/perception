class CreatePerceptionUsers < ActiveRecord::Migration
  def change
    create_table :perception_users do |t|
      t.string :username
      t.string :fullname
      t.string :email
      t.string :company
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
