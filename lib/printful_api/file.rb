module PrintfulAPI

	class File < APIResource
		extend PrintfulAPI::APIOperations::List
		extend PrintfulAPI::APIOperations::Create
		extend PrintfulAPI::APIOperations::Get

		attr_accessor :id, :type, :hash, :url, :filename, :mime_type, :size, :width, :height, :dpi, :status, :created, :thumbnail_url, :preview_url, :visible


		def self.resource_path
			'/files'
		end

	end

end
