class Map < ActiveRecord::Base
	validate :name, :latitude, :longitude

#	def as_json(options={})
#		{
#				id: self.id
#		}
#	end
end
