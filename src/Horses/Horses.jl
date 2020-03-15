module Horses

using Dates


struct Horse
    name::String
    present::Bool
    dateofbirthday::Union{Date, Nothing}

    Horse(name) = new(name, true, nothing)
    Horse(name, present, dateofbirthday) = new(name, present, dateofbirthday)
end

end