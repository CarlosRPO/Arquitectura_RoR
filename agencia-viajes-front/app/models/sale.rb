require_relative 'http_base'

class Sale < HttpBase
	include ActiveModel::Model

	attr_accessor :customer_id, :destination_id, :quantity, :total, :sale_date, :id, :created_at, :updated_at, :url

	validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
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
		'/sales'
	end

	def self.all
		response = HTTParty.get(path, headers: { 'token' => TOKEN })
		response.parsed_response.map do |sale|
			new(sale)
		end
	end

	def self.find(sale_id)
		response = HTTParty.get(path("/#{sale_id}"), headers: { 'token' => TOKEN })
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
			sale: {
				customer_id: self.customer_id,
				destination_id: self.destination_id,
				quantity: self.quantity,
				total: self.total,
				sale_date: self.sale_date
			}
		}
	end

end