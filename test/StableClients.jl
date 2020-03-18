import Horses.Horse
import Clients.Client


@testset "StableClients" begin
    clients = Set{Client}([Client{Horse}("foo"), Client{Horse}("bar")])

    @testset "Constructor" begin
        stableclients = Stable.StableClients()

        @test Stable.numberofclients(stableclients) == 0
    end

    @testset "Constructor with clients" begin
        stableclients = Stable.StableClients(clients)

        @test Stable.numberofclients(stableclients) == 2
    end

    @testset "Construction ensure copy of clients" begin
        cpy = copy(clients)
        stableclients = Stable.StableClients(cpy)

        @test Stable.numberofclients(stableclients) == 2
        pop!(cpy)
        @test Stable.numberofclients(stableclients) == 2
    end

    @testset "Add client" begin
        client = first(clients)
        stableclients = Stable.StableClients()

        Stable.addclient!(stableclients, client)
        @test Stable.numberofclients(stableclients) == 1
    end

    @testset "Remove client" begin
        client = first(clients)
        stableclients = Stable.StableClients(clients)

        Stable.removeclient(stableclients, client)
        @test Stable.numberofclients(stableclients) == 1
    end
end
