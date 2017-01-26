module PrintfulAPI

	class Order < APIResource
		include PrintfulAPI::APIOperations::Create
		include PrintfulAPI::APIOperations::Delete
		include PrintfulAPI::APIOperations::Get
		include PrintfulAPI::APIOperations::List
		include PrintfulAPI::APIOperations::Update
		include PrintfulAPI::APIOperations::Save

		api_attributes :id, :external_id, :status, :created, :updated, :costs, :shipments, :shipping, :recipient, :items, :retail_costs, :gift, :packing_slip, :currency

		def self.resource_path
			'/orders'
		end

	end

end
