Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "297182674247120", "5376be3a679730732992182a404b32ec"
end