module Stable

import Horses.Horse
import Clients.Client

include("./StableHorses.jl")
include("./StableClients.jl")
include("./StableEquipements.jl")
include("./StableGeographicCoordinates.jl")


"""
    ClientsAndHorses(clients, horses)

Contain each clients and horses of the stable
Horses of clients are directly save in clients element
Horses of Stable are horses owned by the stable
"""
struct ClientsAndHorses
    clients::StableClients  # Clients and theirs horses
    horses::StableHorses  # Stable's horses

    ClientsAndHorses(clients=Set{Client}(), horses=Set{Horse}()) = new(StableClients(clients), StableHorses(horses))
end

function numberofclients(clientsandhorses::ClientsAndHorses)::Int
    numberofclients(clientsandhorses.clients)
end

function numberofhorses(clientsandhorses::ClientsAndHorses)::Int
    numberofhorses(clientsandhorses.horses)
end

function addhorse!(clientsandhorses::ClientsAndHorses, horse::Horse)::ClientsAndHorses
    addhorse!(clientsandhorses.horses, horse)
    clientsandhorses
end

function addclient!(clientsandhorses::ClientsAndHorses, client::Client{Horse})::ClientsAndHorses
    addclient!(clientsandhorses.clients, client)
    clientsandhorses
end

end # module
