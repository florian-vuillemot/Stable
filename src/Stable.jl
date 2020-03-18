module Stable

using Horses
using Clients

include("./StableHorses.jl")
include("./StableClients.jl")


"""
    ClientsAndHorses(clients, horses)

Contain each clients and horses of the stable
Horses of clients are directly save in clients element
Horses of Stable are horses owned by the stable
"""
struct ClientsAndHorses
    clients::StableClients  # Clients and theirs horses
    horses::StableHorses  # Stable's horses

    ClientsAndHorses(clients=Set{Clients.Client}(), horses=Set{Horses.Horse}()) = new(StableClients(clients), StableHorses(horses))
end

function numberofclient(clientsandhorses::ClientsAndHorses)::Int
    numberofclient(clientsandhorses.clients)
end

function numberofhorse(clientsandhorses::ClientsAndHorses)::Int
    numberofhorse(clientsandhorses.horses)
end

end # module
