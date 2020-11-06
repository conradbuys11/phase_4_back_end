require 'poke-api-v2'

x = 1
while x < 2
    resp = PokeApi.get(pokemon: x)

    Species.create({
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


    x += 1
end