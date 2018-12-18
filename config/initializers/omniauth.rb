Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :vkontakte, ENV['VK_KEY'], ENV['VK_SECRET'],
           {
               :scope => 'notify,email,photos',
               :display => 'popup',
               :lang => 'ru'
           }
end