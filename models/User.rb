class User

  require 'securerandom'
  require 'json'

  def initialize(username)
    db_connection_string = ENV["DB"].to_s
    binding.pry
    @firebase = Firebase::Client.new(db_connection_string)
    if username.class == String && username.size > 0
      @user = {
          :username => username,
          :api_key => SecureRandom.uuid,
          :created_on => Firebase::ServerValue::TIMESTAMP
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
