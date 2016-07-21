class Log

  def initialize(api_key, resource, ip, host)
    db_connection_string = ENV["DB"].to_s
    @firebase = Firebase::Client.new(db_connection_string)
    if api_key.class == String && api_key.size > 0
      @log = {
          :api_key => api_key,
          :resource => resource,
          :timestamp => Time.now.getutc,
          :ip => ip,
          :host => host
      }
      p @log
    else 
    	@log = Hash.new
    end
  end

  def is_api_key_valid 
  	key = @log[:api_key]
  	response = @firebase.get('users', { :api_key =>  key })
	parsed = JSON.parse(response.raw_body)
	is_valid = false

    parsed.each do |user|
  		binding.pry
  		if user[1]["api_key"] == @log[:api_key]
  			return true
  		end
    end

    return false
  end

  def save
    response = @firebase.push('access_logs', @log)
    p response
  end

end
