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
		belongs_to :retail_cost, class: 'PrintfulAPI::Cost'
		belongs_to :gift, class: 'PrintfulAPI::GiftData'
		belongs_to :packing_slip
		has_many :shipments


		def self.resource_path
			'/orders'
		end

	end

end
