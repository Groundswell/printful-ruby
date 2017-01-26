module PrintfulAPI

	class Product < APIResource
		include PrintfulAPI::APIOperations::List
		include PrintfulAPI::APIOperations::Get

		api_attributes :id, :type, :brand, :model, :image, :variant_count, :files, :options, :dimensions

		def variants
			@variants ||= PrintfulAPI::Variant.list( product_id: self.id )

			@variants
		end

		def self.resource_path
			'/products'
		end

		def load_data( data )

			if data['product'].present?

				super(data['product'])

				@variants = data['variants'].collect do |variant_data|
					variant = PrintfulAPI::Variant.new.load_data( variant_data )
					variant.product = self
					variant
				end

			else

				super( data )

			end

		end




	end

end
