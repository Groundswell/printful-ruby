module PrintfulAPI

	class Order < APIResource
		extend PrintfulAPI::APIOperations::List

		attr_accessor :id, :type, :brand, :model, :image, :variant_count, :files, :options, :dimensions


		def self.resource_path
			'/orders'
		end

	end

end
