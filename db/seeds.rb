require 'poke-api-v2'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Type.destroy_all
SpeciesType.destroy_all
Species.destroy_all


# types = Type.create([
#     {name: 'Normal', value: 1, double_against: 0, half_against: 69632, immune_against: 8192},
#     {name: 'Fire', value: 2, double_against: 67632, half_against: 20486, immune_against: 0},
#     {name: 'Water', value: 4, double_against: 4354, half_against: 16404, immune_against: 0},
#     {name: 'Electic', value: 8, double_against: 516, half_against: 16408, immune_against: 256},
#     {name: 'Grass', value: 16, double_against: 4356, half_against: 84626, immune_against: 0},
#     {name: 'Ice', value: 32, double_against: 17168, half_against: 65574, immune_against: 0},
#     {name: 'Fighting', value: 64, double_against: 102433, half_against: 134784, immune_against: 8192},
#     {name: 'Poison', value: 128, double_against: 131088, half_against: 12672, immune_against: 65536},
#     {name: 'Ground', value: 256, double_against: 69770, half_against: 2064, immune_against: 512},
#     {name: 'Flying', value: 512, double_against: 2128, half_against: 69640, immune_against: 0},
#     {name: 'Psychic', value: 1024, double_against: 192, half_against: 66560, immune_against: 0},
#     {name: 'Bug', value: 2048, double_against: 33808, half_against: 205506, immune_against: 0},
#     {name: 'Rock', value: 4096, double_against: 2594, half_against: 65856, immune_against: 0},
#     {name: 'Ghost', value: 8192, double_against: 9216, half_against: 32768, immune_against: 1},
#     {name: 'Dragon', value: 16384, double_against: 16384, half_against: 65536, immune_against: 131072},
#     {name: 'Dark', value: 32768, double_against: 9216, half_against: 163904, immune_against: 0},
#     {name: 'Steel', value: 65536, double_against: 135200, half_against: 65550, immune_against: 0},
#     {name: 'Fairy', value: 131072, double_against: 49216, half_against: 65666, immune_against: 0}
# ])

# Species.create({
#     name: 'Bulbasaur',
#     sprite_front: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
#     sprite_front: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png',

# })
x = 1
while x <= 151
    resp = PokeApi.get(pokemon: x)

    species = Species.create({
        name: resp.species.name.capitalize(),
        sprite_front: resp.sprites.front_default,
        sprite_back: resp.sprites.back_default,
        hp_base: resp.stats[0].base_stat,
        atk_base: resp.stats[1].base_stat,
        def_base: resp.stats[2].base_stat,
        spa_base: resp.stats[3].base_stat,
        spd_base: resp.stats[4].base_stat,
        spe_base: resp.stats[5].base_stat
    })

    y = 0
    while y < resp.types.length
        type = Type.find_by(name: resp.types[y].type.name.capitalize())
        SpeciesType.create({
            species: species,
            type: type
        })
        y += 1
    end
    x += 1
end

StatusEffect.create([{
    name: 'paralysis',
    accuracy: 0.26
},
{
    name: 'sleep',
    accuracy: 1,
    duration: 3
},
{
    name: 'poison',
    accuracy: 1,
    power: 12.5
},
{
    name: 'burn',
    accuracy: 1,
    power: 6.25
},
{
    name: 'confusion',
    accuracy: 0.33,
    power: 15
})

