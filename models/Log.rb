class Log

  def initialize(api_key, resource, ip, host)
    db_connection_string = ENV["DB"].to_s
    @firebase = Firebase::Client.new(db_connection_string)
    if username.class == String && username.size > 0
      @log = {
          :api_key => SecureRandom.uuid,
          :resource => resource,
          :timestamp => Time.now.getutc,
          :ip => ip,
          :host => host
      }
      p @user
    end
  end

  def is_api_key_valid(key) 
  	response = @firebase.get('users', { :api_key => key })
  	binding.pry
  end

  def save
    response = @firebase.push('access_logs', @log)
    p response
  end

end
