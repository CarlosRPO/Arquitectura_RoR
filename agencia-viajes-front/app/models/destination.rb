require_relative 'http_base'

class Destination < HttpBase
	include ActiveModel::Model

	attr_accessor :city, :country, :price, :taxes, :total, :status, :id, :created_at, :updated_at, :url

	validates :city, presence: true, length: 3..30
	validates :country, presence: true, length: 3..30
	validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :taxes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :total, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	def initialize(params = {})
		params.each do |key, val|
			self.send("#{key}=", val)
		end
	end

	def persisted?
		self.id.present?
	end

	def self.endpoint
		'/destinations'
	end

	def self.all
		response = HTTParty.get(path, headers: { 'token' => TOKEN })
		response.parsed_response.map do |destination|
			new(destination)
		end
	end

	def self.find(destination_id)
		response = HTTParty.get(path("/#{destination_id}"), headers: { 'token' => TOKEN })
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
			destination: {
				city: self.city,
				country: self.country,
				price: self.price,
				taxes: self.taxes,
				total: self.total,
				status: self.status
			}
		}
	end

end