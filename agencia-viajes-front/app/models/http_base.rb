class HttpBase

	BASE_URL = 'http://localhost:3000'
	TOKEN = '2795a6e1-9612-4109-b560-8f6b1f8e2684'

	def self.endpoint
		raise 'Not Implemented'
	end

	def self.path(request_path = '')
		BASE_URL + self.endpoint + request_path + '.json'
	end

	def self.all
		response = HTTParty.get(path)
		response.parsed_response
	end

	def self.find(id)
		response = HTTParty.get(path("/#{id}"))
		new(response.parsed_response)
	end

	def self.create(hash)
		HTTParty.post(path, query: hash)
	end

	def save
		HTTParty.post(self.class.path, query: to_json)
	end

	def self.delete(id)
		HTTParty.delete(path("/#{id}"))
	end

end