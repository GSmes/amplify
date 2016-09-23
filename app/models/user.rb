class User < ActiveRecord::Base

  def self.find_or_create_from_auth(auth)
    find_or_create_by(
      name: auth.uid,
      email: auth.info.email,
      access_token: auth.credentials.token,
      refresh_token: auth.credentials.refresh_token,
      token_expiry: auth.credentials.expires_at
    )
  end

end
