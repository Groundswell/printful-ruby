module PrintfulAPI

	class Product < APIResource
		extend PrintfulAPI::APIOperations::List

		attr_accessor :id, :type, :brand, :model, :image, :variant_count, :files, :options, :dimensions


		def self.resource_path
			'/countries'
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
