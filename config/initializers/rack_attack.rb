Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new # defaults to Rails.cache


Rack::Attack.throttle("requests by ip", limit: ENV['REQUEST_PER_MINUTE'].to_i, period: 1.minutes) do |request|
  if request.path == '/check' && request.get?
    request.ip
  end
end


Rack::Attack.throttled_response = lambda do |env|
  [ 503, {}, ["retry after one minute."]]
end