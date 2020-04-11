class UsersController < ApplicationController
  after_action :redirect, only: %w[choose_categories]

  def choose_categories
    @categories = Category.all
    current_user.categories = Category.where(id: params[:category_ids])
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to root_path, success: "Updated!"
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def redirect
    redirect_to root_path if current_user.categories.count > 0
  end

end
