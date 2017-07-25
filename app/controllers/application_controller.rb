class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def templates
    @templates = [
      "N",
      "A N",
      "PN",
      "A PN",
      "N + N",
      "A N + A N",
      "A N + N",
      "N + A N",
      "PN + PN",
      "A PN + A PN",
      "A PN + PN",
      "PN + A PN",
      "N + PN",
      "PN + N",
      "A N + A PN",
      "A PN + A N",
      "A N + PN",
      "N + A PN",
      "A PN + N",
      "PN + A N",
    ]
  end

  protected

  def authenticate_user
    if cookies[:auth_token]
      @current_user = User.find_by_auth_token!(cookies[:auth_token])
      return true
    else
      redirect_to landing_path
      return false
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to root_path
      return false
    else
      return true
    end
  end
end
