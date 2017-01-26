module PrintfulAPI

	class Order < APIResource
		extend PrintfulAPI::APIOperations::List

		attr_accessor :id


		def self.resource_path
			'/orders'
		end

	end

end
