module EmailChecker
  extend ActiveSupport::Concern

  def valid_mail?(email)
    params = {access_key: ENV['MAILBOX_ACCESS_KEY'], email: email, smtp: 1, format: 1}
    response = RestClient.get('http://apilayer.net/api/check', params: params) {|response|
      rescue_response(response)
    }
    response["smtp_check"]
  end


  def rescue_response(response)
    case response.code
      when 200..399
        if response.body.empty?
          {}
        else
          JSON.parse response.body
        end
      else
        begin
          response.return!
        rescue Exception => e
          return JSON.parse(e.response)
        end
    end
  end
end

