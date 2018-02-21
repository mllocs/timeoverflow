class MobilePushNotificationsService
  # TODO: define notification POROs
  def send(notification, user)
    user.device_tokens.each do |token|
      # request to expo API
    end
  end
end
