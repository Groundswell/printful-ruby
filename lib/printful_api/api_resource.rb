module PrintfulAPI
	class APIResource

		attr_accessor :raw_data

		def load_data( data )
			self.raw_data = data
			data.each do |key,value|

				self.try("#{key}=", value)

			end

			self

		end

	end
end
