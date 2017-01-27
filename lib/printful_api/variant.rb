module PrintfulAPI

	class Variant < APIResource
		include PrintfulAPI::APIOperations::Get

		api_attributes :id, :product_id, :name, :size, :color, :color_code, :image, :price, :in_stock

		belongs_to :product

		def self.resource_path
			'/products/variant'
		end

	end

end
