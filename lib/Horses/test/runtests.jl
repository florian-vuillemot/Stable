using Test
using Dates

using Horses


@testset "Create Horse" begin
    name = "foo"

    @testset "From name" begin
        horse = Horses.Horse(name)

        @test horse.name == name
        @test horse.present == true
        @test horse.dateofbirthday == nothing
    end

    @testset "With all parameters" begin
        present = false
        dateofbirthday = Date(2019)

        horse = Horses.Horse(name, present, dateofbirthday)

        @test horse.name == name
        @test horse.present == present
        @test horse.dateofbirthday == dateofbirthday
    end
end
