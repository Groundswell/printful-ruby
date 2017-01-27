module PrintfulAPI

	class Item < APIResource


		api_attributes :id, :external_id, :variant_id, :quantity, :price, :retail_price, :name, :sku
		has_many :files
		has_many :options, class: 'PrintfulAPI::ItemOption'
		belongs_to :product, class: 'PrintfulAPI::ProductVariant'
		# belongs_to :variant

	end

end
