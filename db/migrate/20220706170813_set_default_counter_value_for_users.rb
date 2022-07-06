class SetDefaultCounterValueForUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :posts_counter, from: nil, to: 0
    change_column_null :users, :posts_counter, false
  end
end
