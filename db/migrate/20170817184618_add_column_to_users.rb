class AddColumnToUsers < ActiveRecord::Migration
  def change
    # ログイン・ログアウトするのに必要
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
  end
end
