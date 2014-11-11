class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def all
    logger.info request.env["omniauth.auth"]
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect user, notice: "Signed in!"
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :twitter, :all

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:users) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :uid, :provider, :username)
    end
  end

end
