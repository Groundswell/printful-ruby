module PrintfulAPI

	class Cost < APIResource

		api_attributes :discount, :shipping, :tax, :subtotal, :total, :digitization

	end

end
