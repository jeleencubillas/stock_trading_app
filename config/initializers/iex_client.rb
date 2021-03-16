def initialize_new_client
  @client = IEX::Api::Client.new(
    publishable_token: Rails.application.credentials[:publishable_token],
    secret_token: Rails.application.credentials[:secret_token],
    endpoint: Rails.application.credentials[:endpoint]
  )
end
