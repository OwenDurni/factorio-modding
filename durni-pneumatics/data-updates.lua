local list = require "list"

--[[
Take half the character mining speed from vanilla Steel Axe and make it available on Pneumatics
instead. This gives the player an immediate benefit from researching Pneumatics.
--]]
local vTech = data.raw["technology"]["steel-axe"]
local myTech = data.raw["technology"]["durni:pneumatics"]

local vEffectRef = list.kvFind(vTech.effects, "type", "character-mining-speed")
local vMod = vEffectRef.modifier

vEffectRef.modifier = vMod / 2
table.insert(myTech.effects, {type = "character-mining-speed", modifier = vMod / 2})
