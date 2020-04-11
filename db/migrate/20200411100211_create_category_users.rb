class CreateCategoryUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :category_users do |t|
      t.belongs_to :category
      t.belongs_to :user
      t.timestamps
    end
  end
end
