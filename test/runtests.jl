using Test

using Horses
using Clients
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


@testset "StableClients" begin
    clients = Set{Clients.Client}([Clients.Client{Horses.Horse}("foo"), Clients.Client{Horses.Horse}("bar")])

    @testset "Constructor" begin
        stableclients = Stable.StableClients()

        @test length(stableclients.clients) == 0
    end

    @testset "Constructor with clients" begin
        stableclients = Stable.StableClients(clients)

        @test length(stableclients.clients) == 2
    end

    @testset "Construction ensure copy of clients" begin
        cpy = copy(clients)
        stableclients = Stable.StableClients(cpy)

        @test length(stableclients.clients) == 2
        pop!(cpy)
        @test length(stableclients.clients) == 2
    end

    @testset "Add client" begin
        client = first(clients)
        stableclients = Stable.StableClients()

        Stable.addclient(stableclients, client)
        @test length(stableclients.clients) == 1
    end

    @testset "Remove client" begin
        client = first(clients)
        stableclients = Stable.StableClients(clients)

        Stable.removeclient(stableclients, client)
        @test length(stableclients.clients) == 1
    end
end


@testset "Stable" begin
    @testset "Constructor" begin
        clientsandhorses = Stable.ClientsAndHorses()
        
    end
end
