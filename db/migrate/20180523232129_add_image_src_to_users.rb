class AddImageSrcToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image_src, :string, default: 'https://academist-app-production.s3.amazonaws.com/uploads/user/profile_image/3203/default_user_icon.png'
  end
end
