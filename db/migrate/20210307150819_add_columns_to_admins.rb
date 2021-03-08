class AddColumnsToAdmins < ActiveRecord::Migration[6.1]
  def change

    # Add username
    add_column :admins, :username, :string, unique:true

    # Add Email Confirmation Token
    add_column :admins, :confirmation_token, :string, unique:true
    add_column :admins, :confirmed_at, :datetime
    add_column :admins, :confirmation_sent_at, :datetime
    add_column :admins, :unconfirmed_email, :string

    # Add Password Reset Token
    add_column :admins, :reset_password_token, :string, unique:true
    add_column :admins, :reset_password_sent_at, :datetime

  end
end
