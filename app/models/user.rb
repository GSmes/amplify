class User < ActiveRecord::Base

  def self.find_or_create_from_auth(auth)
    find_or_create_by(
      name: auth.info.name,
      access_token: auth.credentials.token,
      refresh_token: auth.credentials.refresh_token,
      token_expiry: auth.credentials.expires_at
    )
  end

end