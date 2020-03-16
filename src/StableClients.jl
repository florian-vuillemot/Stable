using Clients


struct StableClients
    clients::Set{Clients.Client}

    StableClients(clients=Set{Clients.Client}()) = new(copy(clients))
end


function addclient(stableclients::StableClients, client::Clients.Client)::StableClients
    push!(stableclients.clients, client)
    stableclients
end

function removeclient(stableclients::StableClients, client::Clients.Client)::StableClients
    delete!(stableclients.clients, client)
    stableclients    
end
