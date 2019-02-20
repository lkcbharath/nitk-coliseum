json.extract! response, :id, :correct_response, :given_response, :time_taken, :created_at, :updated_at
json.url response_url(response, format: :json)
