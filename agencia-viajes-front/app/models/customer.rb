require_relative 'http_base'

class Customer < HttpBase
	include ActiveModel::Model

	attr_accessor :name, :last_name, :identification, :email, :birth_date, :phone, :id, :created_at, :updated_at, :url

	validates :name, presence: true, length: 3..30
	validates :last_name, presence: true, length: 3..30
	validates :identification, presence: true, numericality: { only_integer: true }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	def initialize(params = {})
		params.each do |key, val|
			self.send("#{key}=", val)
		end
	end

	def persisted?
		self.id.present?
	end

	def self.endpoint
		'/customers'
	end

	def self.all
		response = HTTParty.get(path, headers: { 'token' => TOKEN })
		response.parsed_response.map do |customer|
			new(customer)
		end
	end

	def self.find(customer_id)
		response = HTTParty.get(path("/#{customer_id}"), headers: { 'token' => TOKEN })
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
			customer: {
				name: self.name,
				last_name: self.last_name,
				identification: self.identification,
				email: self.email,
				birth_date: self.birth_date,
				phone: self.phone
			}
		}
	end

end