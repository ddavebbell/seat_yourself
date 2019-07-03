module UsersHelper
  def current_user_is_restaurant_owner?(restaurant)
    User.find(session[:user_id]) == restaurant.user
  end
end
