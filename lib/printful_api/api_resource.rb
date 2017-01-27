module PrintfulAPI
	class APIResource

		attr_accessor :raw_data

		class << self; attr_accessor :api_attribute_list end


		def self.api_attributes( *args )
			self.api_attribute_list = (self.api_attribute_list || []).concat(args)

			attr_accessor *args
		end

		def self.has_many( attribute_name, args = {} )
			args[:class] = args[:class] if args[:class].is_a? String
			args[:class] ||= "PrintfulAPI::#{attribute_name.to_s.camelize.singularize}"

			self.api_attributes *[attribute_name.to_sym]

        	define_method("#{attribute_name}=") do |array|
				if array.present?
					array = array.collect do |data|
						args[:class].constantize.new.load_data(data)
					end
				end
				self.instance_variable_set("@#{attribute_name}", array)
			end
		end

		def self.belongs_to( attribute_name, args = {} )
			args[:class] = args[:class] if args[:class].is_a? String
			args[:class] ||= "PrintfulAPI::#{attribute_name.to_s.camelize}"

			self.api_attributes *[attribute_name.to_sym]
			define_method("#{attribute_name}=") do |data|
				self.instance_variable_set("@#{attribute_name}", args[:class].constantize.new.load_data(data))
			end
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
