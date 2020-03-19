using Test

using Stable

include("StableClients.jl");
include("StableHorses.jl");
include("StableEquipements.jl");
include("StableGeographicCoordinates.jl");


@testset "ClientsAndHorses" begin
    @testset "Constructor" begin
        clientsandhorses = Stable.ClientsAndHorses()

        @test Stable.numberofhorses(clientsandhorses) == 0
        @test Stable.numberofclients(clientsandhorses) == 0
    end

    @testset "Add client" begin
        client = Client{Horse}("foo")
        clientsandhorses = Stable.ClientsAndHorses()

        Stable.addclient!(clientsandhorses, client)

        @test Stable.numberofclients(clientsandhorses) == 1
        @test Stable.numberofhorses(clientsandhorses) == 0
    end

    @testset "Ensure unique client entry" begin
        client = Client{Horse}("foo")
        clientsandhorses = Stable.ClientsAndHorses()

        Stable.addclient!(clientsandhorses, client)
        
        @test clientsandhorses == Stable.addclient!(clientsandhorses, client)
        @test Stable.numberofclients(clientsandhorses) == 1
        @test Stable.numberofhorses(clientsandhorses) == 0
    end

    @testset "Add clients" begin
        client = Client{Horse}("foo")
        client2 = Client{Horse}("bar")
        
        clientsandhorses = Stable.ClientsAndHorses()

        Stable.addclient!(clientsandhorses, client)
        Stable.addclient!(clientsandhorses, client2)

        @test Stable.numberofclients(clientsandhorses) == 2
        @test Stable.numberofhorses(clientsandhorses) == 0
    end

    @testset "Add horse" begin
        horse = Horse("foo")
        clientsandhorses = Stable.ClientsAndHorses()

        Stable.addhorse!(clientsandhorses, horse)

        @test Stable.numberofhorses(clientsandhorses) == 1
        @test Stable.numberofclients(clientsandhorses) == 0
    end

    @testset "Ensure unique horse entry" begin
        horse = Horse("foo")
        clientsandhorses = Stable.ClientsAndHorses()

        Stable.addhorse!(clientsandhorses, horse)
        
        @test clientsandhorses == Stable.addhorse!(clientsandhorses, horse)
        @test Stable.numberofhorses(clientsandhorses) == 1
        @test Stable.numberofclients(clientsandhorses) == 0
    end

    @testset "Add horses" begin
        horse = Horse("foo")
        horse2 = Horse("foo2")
        
        clientsandhorses = Stable.ClientsAndHorses()

        Stable.addhorse!(clientsandhorses, horse)
        Stable.addhorse!(clientsandhorses, horse2)

        @test Stable.numberofhorses(clientsandhorses) == 2
        @test Stable.numberofclients(clientsandhorses) == 0
    end
end
