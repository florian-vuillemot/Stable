using Stable
import Equipements.Equipement


@testset "Constructor" begin
    @testset "Without argument" begin
        st = Stable.StableEquipements()

        @test Stable.numberofequipements(st) == 0
    end
    
    @testset "With an equipement" begin
        equipements = Set([Equipement("")])

        st = Stable.StableEquipements(equipements)
        @test Stable.numberofequipements(st) == 1
    end
end

@testset "Add equipement" begin
    equipement = Equipement("")
    
    st = Stable.StableEquipements()
    Stable.addequipement!(st, equipement)
    @test Stable.numberofequipements(st) == 1
end

@testset "Remove equipement" begin
    equipements = Set([Equipement("")])

    st = Stable.StableEquipements(equipements)
    @test Stable.numberofequipements(st) == 1
    Stable.removeequipement!(st, pop!(equipements))
    @test Stable.numberofequipements(st) == 0
end
