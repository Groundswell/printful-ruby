module PrintfulAPI

	class ProductVariant < APIResource


		api_attributes :variant_id, :product_id, :image, :name

		belongs_to :variant
		belongs_to :product


	end

end
