module PrintfulAPI

	class Address < APIResource

		api_attributes :name, :company, :address1, :address2, :city, :state_code, :country_code, :zip, :phone, :email, :state_name, :country_name

	end

end
