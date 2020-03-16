using Horses


struct StableHorses
    horses::Set{Horses.Horse}

    StableHorses(horses=Set{Horses.Horse}()) = new(copy(horses))
end


function addhorse(stablehorse::StableHorses, horse::Horses.Horse)::StableHorses
    push!(stablehorse.horses, horse)
    stablehorse    
end

function removehorse(stablehorse::StableHorses, horse::Horses.Horse)::StableHorses
    delete!(stablehorse.horses, horse)
    stablehorse    
end

