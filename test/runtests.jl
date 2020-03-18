using Test

using Horses
using Clients
using Stable


@testset "StableHorses" begin
    horses = Set{Horses.Horse}([Horses.Horse("foo"), Horses.Horse("bar")])

    @testset "Constructor" begin
        stablehorses = Stable.StableHorses()

        @test Stable.numberofhorse(stablehorses) == 0
    end

    @testset "Constructor with horses" begin
        stablehorses = Stable.StableHorses(horses)

        @test Stable.numberofhorse(stablehorses) == 2
    end

    @testset "Construction ensure copy of horses" begin
        cpy = copy(horses)
        stablehorses = Stable.StableHorses(cpy)

        @test Stable.numberofhorse(stablehorses) == 2
        pop!(cpy)
        @test Stable.numberofhorse(stablehorses) == 2
    end

    @testset "Add horse" begin
        horse = first(horses)
        stablehorses = Stable.StableHorses()

        Stable.addhorse(stablehorses, horse)
        @test Stable.numberofhorse(stablehorses) == 1
    end

    @testset "Remove horse" begin
        horse = first(horses)
        stablehorses = Stable.StableHorses(horses)

        Stable.removehorse(stablehorses, horse)
        @test Stable.numberofhorse(stablehorses) == 1
    end
end


@testset "StableClients" begin
    clients = Set{Clients.Client}([Clients.Client{Horses.Horse}("foo"), Clients.Client{Horses.Horse}("bar")])

    @testset "Constructor" begin
        stableclients = Stable.StableClients()

        @test Stable.numberofclient(stableclients) == 0
    end

    @testset "Constructor with clients" begin
        stableclients = Stable.StableClients(clients)

        @test Stable.numberofclient(stableclients) == 2
    end

    @testset "Construction ensure copy of clients" begin
        cpy = copy(clients)
        stableclients = Stable.StableClients(cpy)

        @test Stable.numberofclient(stableclients) == 2
        pop!(cpy)
        @test Stable.numberofclient(stableclients) == 2
    end

    @testset "Add client" begin
        client = first(clients)
        stableclients = Stable.StableClients()

        Stable.addclient(stableclients, client)
        @test Stable.numberofclient(stableclients) == 1
    end

    @testset "Remove client" begin
        client = first(clients)
        stableclients = Stable.StableClients(clients)

        Stable.removeclient(stableclients, client)
        @test Stable.numberofclient(stableclients) == 1
    end
end


@testset "Stable" begin
    @testset "Constructor" begin
        clientsandhorses = Stable.ClientsAndHorses()

        @test Stable.numberofhorse(clientsandhorses) == 0
    end
end
