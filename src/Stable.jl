module Stable

using Horses
using Clients

include("./StableHorses.jl")

"""
    ClientsAndHorses(clients, horses)

Contain each clients and horses of the stable
Horses of clients are directly save in clients element
Horses of Stable are in the data list
"""
struct ClientsAndHorses
    clients::Clients.Client{Horses.Horse}  # Clients and theirs horses
    horses::Set{Horses.Horse}  # Stable's horses
end

end # module
