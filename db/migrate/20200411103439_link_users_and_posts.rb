class LinkUsersAndPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user
  end
end
