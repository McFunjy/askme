class MakeUserNicknameNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :nickname, false
  end
end
