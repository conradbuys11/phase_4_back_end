require 'poke-api-v2'

# Trainer.destroy_all

# Type.destroy_all
# SpeciesType.destroy_all
# PokemonMove.destroy_all
# Pokemon.destroy_all
# StatusEffect.destroy_all
# Species.destroy_all
# Move.destroy_all
## USE RAILS DB:RESET, OR RAILS DB:DROP RAILS DB:SETUP


types = Type.create([
    {name: 'Normal', value: 1, double_against: 0, half_against: 69632, immune_against: 8192},
    {name: 'Fire', value: 2, double_against: 67632, half_against: 20486, immune_against: 0},
    {name: 'Water', value: 4, double_against: 4354, half_against: 16404, immune_against: 0},
    {name: 'Electic', value: 8, double_against: 516, half_against: 16408, immune_against: 256},
    {name: 'Grass', value: 16, double_against: 4356, half_against: 84626, immune_against: 0},
    {name: 'Ice', value: 32, double_against: 17168, half_against: 65574, immune_against: 0},
    {name: 'Fighting', value: 64, double_against: 102433, half_against: 134784, immune_against: 8192},
    {name: 'Poison', value: 128, double_against: 131088, half_against: 12672, immune_against: 65536},
    {name: 'Ground', value: 256, double_against: 69770, half_against: 2064, immune_against: 512},
    {name: 'Flying', value: 512, double_against: 2128, half_against: 69640, immune_against: 0},
    {name: 'Psychic', value: 1024, double_against: 192, half_against: 66560, immune_against: 0},
    {name: 'Bug', value: 2048, double_against: 33808, half_against: 205506, immune_against: 0},
    {name: 'Rock', value: 4096, double_against: 2594, half_against: 65856, immune_against: 0},
    {name: 'Ghost', value: 8192, double_against: 9216, half_against: 32768, immune_against: 1},
    {name: 'Dragon', value: 16384, double_against: 16384, half_against: 65536, immune_against: 131072},
    {name: 'Dark', value: 32768, double_against: 9216, half_against: 163904, immune_against: 0},
    {name: 'Steel', value: 65536, double_against: 135200, half_against: 65550, immune_against: 0},
    {name: 'Fairy', value: 131072, double_against: 49216, half_against: 65666, immune_against: 0}
])

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
    name: 'none'
},
{
    name: 'paralysis',
    accuracy: 26
},
{
    name: 'sleep',
    accuracy: 100,
    duration: 3
},
{
    name: 'poison',
    accuracy: 100,
    power: 12.5
},
{
    name: 'burn',
    accuracy: 100,
    power: 6.25
},
{
    name: 'confusion',
    accuracy: 33,
    power: 15
}])


movesToAdd = ['poison-powder', 'seed-bomb', 'razor-leaf', 
'sludge-bomb', 'water-pulse', 'flash-cannon', 'bite', 'hydro-pump', 'body-slam', 
'flamethrower', 'aerial-ace', 'dragon-breath', 'play-rough', 'poison-fang', 'air-cutter',
'shadow-ball', 'thunder-punch', 'thunderbolt', 'psychic', 'confusion', 'ice-beam', 'blizzard',
'signal-beam', 'x-scissor', 'dragon-claw', 'dazzling-gleam', 'brick-break', 'drill-run', 'earth-power',
'rock-slide', 'power-gem', 'iron-head', 'fire-punch', 'horn-attack', 'peck', 'astonish', 'lick',
'stomp', 'water-gun', 'splash', 'tackle']
movesToAdd.each do |move|
    resp = PokeApi.get(move: move)
    type = Type.find_by(name: resp.type.name.capitalize())
    name = resp.name.split('-').map{|word| word.capitalize()}.join(" ")
    newMove = Move.create({
        name: name,
        category: resp.damage_class.name,
        power: resp.power,
        accuracy: resp.accuracy,
        type: type
    })
end

def CreateMoveStatus(move_name, status_name, accuracy)
    MoveStatusEffect.create({
        status_effect: StatusEffect.find_by(name: status_name),
        move: Move.find_by(name: move_name),
        accuracy: accuracy
    })
end

CreateMoveStatus('Poison Powder', 'poison', 100)
CreateMoveStatus('Sludge Bomb', 'poison', 30)
CreateMoveStatus('Water Pulse', 'confusion', 20)
CreateMoveStatus('Body Slam', 'paralysis', 30)
CreateMoveStatus('Flamethrower', 'burn', 10)
CreateMoveStatus('Dragon Breath', 'paralysis', 30)
CreateMoveStatus('Poison Fang', 'poison', 50)
CreateMoveStatus('Thunder Punch', 'paralysis', 10)
CreateMoveStatus('Thunderbolt', 'paralysis', 10)
CreateMoveStatus('Confusion', 'confusion', 10)
CreateMoveStatus('Signal Beam', 'confusion', 10)
CreateMoveStatus('Fire Punch', 'burn', 10)
CreateMoveStatus('Lick', 'paralysis', 30)
# MoveStatusEffect.create([{
#     move: Move.find_by(name: 'Poison Powder'),
#     status_effect: StatusEffect.find_by(name: 'poison'),
#     accuracy: 100
# },{
#     move: Move.find_by(name: 'Sludge Bomb'),
#     status_effect: StatusEffect.find_by(name: 'poison'),
#     accuracy: 30
# },{
#     move: Move.find_by(name: 'Water Pulse'),
#     status_effect: StatusEffect.find_by(name: 'confusion'),
#     accuracy: 20
# },{
#     move: Move.find_by(name: 'Body Slam'),
#     status_effect: StatusEffect.find_by(name: 'paralysis'),
#     accuracy: 30
# },{
#     move: Move.find_by(name: 'Flamethrower'),
#     status_effect: StatusEffect.find_by(name: 'burn'),
#     accuracy: 10
# },{
#     move: Move.find_by(name: 'Dragon Breath'),
#     status_effect: StatusEffect.find_by(name: 'paralysis'),
#     accuracy: 30
# },{
#     move: Move.find_by(name: 'Poison Fang'),
#     status_effect: StatusEffect.find_by(name: 'poison'),
#     accuracy: 50
# }
# ])

def CreatePokemon(pokemon_name, trainer_name, move_names)
    species = Species.find_by(name: pokemon_name.capitalize())
    pokemon = Pokemon.create({
        current_hp: species.hp_base,
        species: species,
        status_effect: StatusEffect.first,
        trainer: Trainer.find_by(name: trainer_name.capitalize())
    })
    move_names.each do |move_name|
        PokemonMove.create({
            pokemon: pokemon,
            move: Move.find_by(name: move_name)
        })
    end
end

TrainerCategory.create([{
    name: 'Player'
},
{
    name: 'Rocket Grunt'
}])

Trainer.create([{
    name: 'Conrad',
    trainer_category: TrainerCategory.first
},{
    name: 'Chad',
    trainer_category: TrainerCategory.second
},{
    name: 'Connor',
    trainer_category: TrainerCategory.second
},{
    name: 'Dum',
    trainer_category: TrainerCategory.second
}
])

CreatePokemon('Ivysaur', 'Conrad', ['Seed Bomb', 'Poison Powder', 'Sludge Bomb', 'Razor Leaf'])
CreatePokemon('Wartortle', 'Conrad', ['Water Pulse', 'Flash Cannon', 'Bite', 'Hydro Pump'])
CreatePokemon('Charmeleon', 'Conrad', ['Flamethrower', 'Dragon Breath', 'Brick Break', 'Fire Punch'])

CreatePokemon('Nidorino', 'Chad', ['Horn Attack', 'Peck', 'Poison Fang'])
CreatePokemon('Golbat', 'Chad', ['Bite', 'Air Cutter', 'Astonish'])

CreatePokemon('Seadra', 'Connor', ['Water Gun', 'Dragon Breath', 'Ice Beam'])
CreatePokemon('Lickitung', 'Connor', ['Lick', 'Stomp'])

CreatePokemon('Magikarp', 'Dum', ['Splash'])
CreatePokemon('Magikarp', 'Dum', ['Splash'])
CreatePokemon('Magikarp', 'Dum', ['Splash', 'Tackle'])

# pokemonToAdd = ['venusaur', 'charizard', 'blastoise']
# pokemonToAdd.each do |pmon|
#     species = Species.find_by(name: pmon.capitalize())
#     pokemon = Pokemon.create({
#         current_hp: species.hp_base,
#         species: species,
#         status_effect: StatusEffect.first,
#         trainer: Trainer.first
#     })
#     PokemonMove.create([{
#         pokemon: pokemon,
#         move: Move.first, 
#     },
#     {
#         pokemon: pokemon,
#         move: Move.second,
#     },
#     {
#         pokemon: pokemon,
#         move: Move.third
#     },
#     {
#         pokemon: pokemon,
#         move: Move.fourth
#     }])
# end

# rocketMons = ['psyduck', 'growlithe', 'mewtwo']
# rocketMons.each do |pmon|
#     species = Species.find_by(name: pmon.capitalize())
#     pokemon = Pokemon.create({
#         current_hp: species.hp_base,
#         species: species,
#         status_effect: StatusEffect.first,
#         trainer: Trainer.second
#     })
#     PokemonMove.create([{
#         pokemon: pokemon,
#         move: Move.first, 
#     },
#     {
#         pokemon: pokemon,
#         move: Move.second,
#     },
#     {
#         pokemon: pokemon,
#         move: Move.third
#     },
#     {
#         pokemon: pokemon,
#         move: Move.fourth
#     }])
# end