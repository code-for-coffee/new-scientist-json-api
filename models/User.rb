class User

  require 'securerandom'
  require 'json'

  def initialize(username, ip, host)
    db_connection_string = ENV["DB"].to_s
    @firebase = Firebase::Client.new(db_connection_string)
    if username.class == String && username.size > 0
      @user = {
          :username => username,
          :api_key => SecureRandom.uuid,
          :created_on => Time.now.getutc,
          :ip => ip,
          :host => host
      }
      p @user
    end
  end

  def save
    response = @firebase.push('users', @user)
    p response
  end

  def to_json
    @user.to_json
  end

end
