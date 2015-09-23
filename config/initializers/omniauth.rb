Rails.application.config.middleware.use OmniAuth::Builder do
 	provider :facebook, "1616090421976171", "d3e6bc0dcb116e94de3c353a08d92c61",
    :scope => 'email,user_about_me,public_profile', :display => 'popup',
    :info_fields => 'email,gender,age_range'
end