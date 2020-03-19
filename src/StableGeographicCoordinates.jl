import GeographicCoordinates.GeographicCoordinate
import GeographicCoordinates.TupleOfGeographicCoordinates

struct StableGeographicCoordinates
    coordinates::Set{TupleOfGeographicCoordinates}

    StableGeographicCoordinates(coordinates=Set{TupleOfGeographicCoordinates}()) = new(coordinates)
end

function addgeographiccoordinate(stablegeographiccoordinates::StableGeographicCoordinates, gc::TupleOfGeographicCoordinates)
    push!(stablegeographiccoordinates, gc)
    stablegeographiccoordinates
end

function removegeographiccoordinate(stablegeographiccoordinates::StableGeographicCoordinates, gc::TupleOfGeographicCoordinates)
    delete!(stablegeographiccoordinates, gc)
    stablegeographiccoordinates
end

function numberofgeographiccoordinate(stablegeographiccoordinates::StableGeographicCoordinates)
    length(stablegeographiccoordinates.coordinates)
end
