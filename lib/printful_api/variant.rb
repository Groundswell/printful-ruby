module PrintfulAPI

	class Variant < APIResource
		extend PrintfulAPI::APIOperations::Get

		attr_accessor :id, :product_id, :name, :size, :color, :color_code, :image, :price, :in_stock, :product

		def self.resource_path
			'/products/variant'
		end


		def self.list( product_id, filters={}, opts={} )

			resource_path = "/products/#{product_id}"

			data_list = PrintfulAPI.request( :GET, resource_path, params: filters )

			product = opts[:product] || PrintfulAPI::Product.new.load_data( data_list['product'] )

			data_list['variants'].collect do |data|

				model = self.new
				model.load_data( data )
				model.product = product
				model

			end

		end




	end

end
