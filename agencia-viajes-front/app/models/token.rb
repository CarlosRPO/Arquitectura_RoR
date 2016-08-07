require_relative 'http_base'

class Token < HttpBase
	include ActiveModel::Model

	attr_accessor :token, :number_of_request, :status, :id, :created_at, :updated_at, :url

	validates :number_of_request, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	def initialize(params = {})
		params.each do |key, val|
			puts "KEY::::::> #{key} ------- VALUE::::::> #{val}"
			self.send("#{key}=", val)
		end
		# self.id = params['id'].to_i
		# self.token = params['token']
		# self.number_of_request = params['number_of_request']
		# self.status = params['status']
	end

	def persisted?
		self.id.present?
	end

	def self.endpoint
		'/tokens'
	end

	def self.all
		puts "PATH::::::::> #{path}"
		response = HTTParty.get(path, headers: { 'token' => TOKEN })
		response.parsed_response.map do |token|
			new(token)
		end
	end

	def self.find(token_id)
		response = HTTParty.get(path("/#{token_id}"), headers: { 'token' => TOKEN })
		new(response.parsed_response)
	end

	def update
		HTTParty.put(self.class.path("/#{id}"), query: to_json, headers: { 'token' => TOKEN })
	end

	def save
		HTTParty.post(self.class.path, query: to_json, headers: { 'token' => TOKEN })
	end

	def destroy
		HTTParty.delete(self.class.path("/#{id}"), headers: { 'token' => TOKEN })
	end

	def to_json
		{
			token: {
				token: self.token,
				number_of_request: self.number_of_request,
				status: self.status
			}
		}
	end

end