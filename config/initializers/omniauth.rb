Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_API_ID'], ENV['SPOTIFY_API_SECRET'], scope: 'playlist-read-private playlist-modify-private playlist-modify-public user-read-email user-read-private'
end
