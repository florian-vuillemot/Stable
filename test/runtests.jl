using Test

using Horses
using Stable


@testset "StableHorses" begin
    horses = Set{Horses.Horse}([Horses.Horse("foo"), Horses.Horse("bar")])

    @testset "Constructor" begin
        stablehorses = Stable.StableHorses()

        @test length(stablehorses.horses) == 0
    end

    @testset "Constructor with horses" begin
        stablehorses = Stable.StableHorses(horses)

        @test length(stablehorses.horses) == 2
    end

    @testset "Construction ensure copy of horses" begin
        cpy = copy(horses)
        stablehorses = Stable.StableHorses(cpy)

        @test length(stablehorses.horses) == 2
        pop!(cpy)
        @test length(stablehorses.horses) == 2
    end

    @testset "Add horse" begin
        horse = first(horses)
        stablehorses = Stable.StableHorses()

        Stable.addhorse(stablehorses, horse)
        @test length(stablehorses.horses) == 1
    end

    @testset "Remove horse" begin
        horse = first(horses)
        stablehorses = Stable.StableHorses(horses)

        Stable.removehorse(stablehorses, horse)
        @test length(stablehorses.horses) == 1
    end
end
