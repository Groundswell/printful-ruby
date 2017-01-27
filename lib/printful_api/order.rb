module PrintfulAPI

	class Order < APIResource
		include PrintfulAPI::APIOperations::Create
		include PrintfulAPI::APIOperations::Delete
		include PrintfulAPI::APIOperations::Get
		include PrintfulAPI::APIOperations::List
		include PrintfulAPI::APIOperations::Update
		include PrintfulAPI::APIOperations::Save

		api_attributes :id, :external_id, :status, :created, :updated, :costs, :shipping, :currency
		belongs_to :recipient, class: 'PrintfulAPI::Address'
		has_many :items
		belongs_to :costs, class: 'PrintfulAPI::Cost'
		belongs_to :retail_costs, class: 'PrintfulAPI::Cost'
		belongs_to :gift, class: 'PrintfulAPI::GiftData'
		belongs_to :packing_slip
		has_many :shipments


		def self.resource_path
			'/orders'
		end

		# Confirm draft for fulfillment
		# Approves for fulfillment an order that was saved as a draft. Store owner's credit card is charged when the order is submitted for fulfillment.
		def confirm_for_fulfillment

			result = PrintfulAPI.request( :POST, "/orders/#{self.id}/confirm", {} )

			self.load_data( result )

			return true

		end

	end

end
