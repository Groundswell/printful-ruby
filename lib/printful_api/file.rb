module PrintfulAPI

	class File < APIResource
		include PrintfulAPI::APIOperations::List
		include PrintfulAPI::APIOperations::Create
		include PrintfulAPI::APIOperations::Get

		api_attributes :id, :type, :hash, :url, :filename, :mime_type, :size, :width, :height, :dpi, :status, :created, :thumbnail_url, :preview_url, :visible


		def self.resource_path
			'/files'
		end

	end

end
