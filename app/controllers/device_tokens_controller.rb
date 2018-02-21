class DeviceTokensController < PostsController
  # before_filter :authenticate_user!

  def create
    @device_token = DeviceToken.build device_token_params

    if @device_token.save
      redirect_to @device_token, status: :created
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  private

  def device_token_params
    params[:device_token].permit(*%w[user_id token])
  end
end
