import Horses.Horse


struct StableHorses
    horses::Set{Horse}

    StableHorses(horses=Set{Horse}()) = new(copy(horses))
end


function addhorse!(stablehorse::StableHorses, horse::Horse)::StableHorses
    push!(stablehorse.horses, horse)
    stablehorse    
end

function removehorse(stablehorse::StableHorses, horse::Horse)::StableHorses
    delete!(stablehorse.horses, horse)
    stablehorse    
end

function numberofhorses(stablehorse::StableHorses)::Int
    length(stablehorse.horses)
end
