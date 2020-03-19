using Test

using Stable
using GeographicCoordinates


@testset "Constructor" begin
    @testset "Without parameter" begin
        st = Stable.StableGeographicCoordinates()

        @test Stable.numberofgeographiccoordinate(st) == 0
    end

    @testset "With parameters" begin
        gc = Set([GeographicCoordinates.TupleOfGeographicCoordinates(1,2,3,4,5,6)])
        st = Stable.StableGeographicCoordinates(gc)

        @test Stable.numberofgeographiccoordinate(st) == 1
    end
end
