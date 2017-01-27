module PrintfulAPI

	class GiftData < APIResource

		api_attributes :id, :carrier, :service, :tracking_number, :tracking_url, :created, :ship_date, :reshipment
		has_many :items

	end

end
