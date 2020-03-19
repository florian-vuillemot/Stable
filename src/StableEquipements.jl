import Equipements.Equipement


struct StableEquipements
    equipements::Set{Equipement}

    StableEquipements(equipements=Set{Equipement}()) = new(copy(equipements))
end


function addequipement!(stableequipements::StableEquipements, equipement::Equipement)::StableEquipements
    push!(stableequipements.equipements, equipement)
    stableequipements
end

function removeequipement!(stableequipements::StableEquipements, equipement::Equipement)::StableEquipements
    delete!(stableequipements.equipements, equipement)
    stableequipements
end

function numberofequipements(stableequipements::StableEquipements)::Int
    length(stableequipements.equipements)
end
