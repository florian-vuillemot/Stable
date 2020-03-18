import Clients.Client


struct StableClients
    clients::Set{Client}

    StableClients(clients=Set{Client}()) = new(copy(clients))
end


function addclient!(stableclients::StableClients, client::Client)::StableClients
    push!(stableclients.clients, client)
    stableclients
end

function removeclient(stableclients::StableClients, client::Client)::StableClients
    delete!(stableclients.clients, client)
    stableclients    
end

function numberofclients(stableclients::StableClients)::Int
    length(stableclients.clients)
end
