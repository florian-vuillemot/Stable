import Horses.Horse


@testset "StableHorses" begin
    horses = Set{Horse}([Horse("foo"), Horse("bar")])

    @testset "Constructor" begin
        stablehorses = Stable.StableHorses()

        @test Stable.numberofhorses(stablehorses) == 0
    end

    @testset "Constructor with horses" begin
        stablehorses = Stable.StableHorses(horses)

        @test Stable.numberofhorses(stablehorses) == 2
    end

    @testset "Construction ensure copy of horses" begin
        cpy = copy(horses)
        stablehorses = Stable.StableHorses(cpy)

        @test Stable.numberofhorses(stablehorses) == 2
        pop!(cpy)
        @test Stable.numberofhorses(stablehorses) == 2
    end

    @testset "Add horse" begin
        horse = first(horses)
        stablehorses = Stable.StableHorses()

        Stable.addhorse!(stablehorses, horse)
        @test Stable.numberofhorses(stablehorses) == 1
    end

    @testset "Remove horse" begin
        horse = first(horses)
        stablehorses = Stable.StableHorses(horses)

        Stable.removehorse(stablehorses, horse)
        @test Stable.numberofhorses(stablehorses) == 1
    end
end
