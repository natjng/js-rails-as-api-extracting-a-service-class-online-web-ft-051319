class SightingSerializer
    def initialize(sighting_object)
        @sighting = sighting_object
    end
    
    def to_serialized_json
        options = {
            include: {
            bird: {
                only: [:name, :species]
            },
            location: {
                only: [:latitude, :longitude]
            }
            },
            except: [:updated_at],
        }

        @sighting.to_json(options)

        # can also write options hash this way
        # options = {}
        # options[:include] = {
        #   bird: {
        #     only: [:name, :species]
        #   },
        #   location: {
        #     only: [:latitude, :longitude]
        #   }
        # }
        # options[:except] = [:updated_at]
    end
end