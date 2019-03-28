class AddDefualtPicToUsers < ActiveRecord::Migration[5.2]

  def change
    change_column :users, :profile_photo, :string, :default => "https://res.cloudinary.com/vvrruubb69e/image/upload/v1553794273/default-user.png"
  end

end
