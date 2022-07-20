class SetDefaultPhotoForUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :photo, from: nil, to: 'https://cdn-icons-png.flaticon.com/128/527/527489.png'
  end
end
