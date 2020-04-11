class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user.categories.count > 0
      root_path
    else
       choose_categories_users_path
    end
  end
end
