require "kemal"
require "./kemal-json-api/*"
require "./kemal-json-api/adapters/*"
require "./kemal-json-api/models/*"
require "./kemal-json-api/resources/*"

module KemalJsonApi
  DEBUG = false

  ALL_ACTIONS = {} of ActionMethod => ActionType

  error 400 do |env|
    env.response.content_type = "application/vnd.api+json"
    {
      "id":     SecureRandom.uuid.to_s,
      "status": "400",
      "detail": "bad_request",
    }.to_json
  end

  error 401 do |env|
    env.response.content_type = "application/vnd.api+json"
    {
      "id":     SecureRandom.uuid.to_s,
      "status": "401",
      "detail": "not_authorized",
    }.to_json
  end

  error 404 do |env|
    env.response.content_type = "application/vnd.api+json"
    {
      "id":     SecureRandom.uuid.to_s,
      "status": "404",
      "detail": "not_found",
    }.to_json
  end

  error 500 do |env|
    env.response.content_type = "application/vnd.api+json"
    {
      "id":     SecureRandom.uuid.to_s,
      "status": "500",
      "detail": "internal_server_error",
    }.to_json
  end
end
