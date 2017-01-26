module PrintfulAPI
	class APIResource

		attr_accessor :raw_data

		class << self; attr_accessor :api_attribute_list end


		def self.api_attributes( *args )
			self.api_attribute_list = args
			attr_accessor *args
		end

		def load_data( data )
			self.raw_data = data
			data.each do |key,value|

				self.try("#{key}=", value)

			end

			self

		end

		def to_h()
			hash = {}
			self.class.api_attribute_list.each do |attribute_name|
				value = self.try(attribute_name)
				if value.is_a? Array

					hash[attribute_name] = value.collect do |array_item|
						if array_item.is_a? APIResource
							hash[attribute_name] = array_item.to_h
						else
							hash[attribute_name] = array_item
						end
					end

				elsif value.is_a? APIResource
					hash[attribute_name] = value.to_h
				else
					hash[attribute_name] = value
				end
			end

			hash
		end

	end
end
