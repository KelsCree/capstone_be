class ApplicationController < ActionController::API

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      @token = JWT.encode({ user_id: @user.id }, Rails.application.secrets.secret_key_base[0])
      render json: { user: @user, token: @token }
    else  
      render json: {errors: ['Invalid username or password']}
    end
  end

end
