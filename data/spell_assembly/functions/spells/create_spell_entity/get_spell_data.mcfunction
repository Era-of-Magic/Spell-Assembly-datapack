
# Mark this entity as spell-entity and rotate to casters facing direction
data merge entity @s {Tags:["spell_assembly","spell"]}
data modify entity @s Rotation set from storage spell_assembly:temp data.Rotation

# Store spell casters UUID and ID in spell entity
data modify entity @s item.tag.SpellCaster set from storage spell_assembly:temp data.SpellCaster
scoreboard players operation @s spellAssembly.id = id temp

# Store the spell id
# Either it will store it in a storage and run a function with that or it will store it in the entity and runs the function with that. Still undecidet. 
execute store result score @s spellAssembly.spellId run data get storage spell_assembly:temp data.SelectedSpellID

# Store important spell data
$data modify storage spell_assembly:temp data.FX set from storage spell_assembly:spells Spells[{ID:$(SelectedSpellID)}].FX
$data modify storage spell_assembly:temp data.Type set from storage spell_assembly:spells Spells[{ID:$(SelectedSpellID)}].Type

# Check spell type
execute at @s run function #spell_assembly:spells/spellcast_type_check with storage spell_assembly:temp data