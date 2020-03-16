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
    clients::Clients.Client{Horses.Horse}  # Clients and theirs horses
    horses::StableHorses  # Stable's horses

    ClientsAndHorses(clients=Clients.Client(), horses=StableHorses()) = new(copy(clients), copy(horses))
end

end # module
