-----------------------------------
-- Area: Abyssea - Vunkerl (217)
--  Mob: Sippoy
-----------------------------------
package.loaded["scripts/zones/Abyssea-Vunkerl/textIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-Vunkerl/textIDs");
require("scripts/globals/keyitems");
require("scripts/globals/abyssea");
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)

end;

function onMobEngaged(mob,target)
end;

function onMobFight(mob,target)
    if (mob:getHPP() < 50) then
        mob:setMobMod(MOBMOD_SPELL_LIST, 159);
    else
        -- I'm assuming that if it heals up, it goes back to the its original spell list.
        mob:setMobMod(MOBMOD_SPELL_LIST, 158);
        -- This 'else' can be removed if that isn't the case, and a localVar added so it only execs once.
    end
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(SIPPOY_CAPTURER);

    if (isKiller == true) then
        local itemRate = math.random(1,100);
        local lootTable =
        {
            [1] = 20961, -- Qatsunoci +1
            [2] = 20775, -- Crobaci +1
            [3] = 20915, -- Iizamal +1
            [4] = 21195, -- Uffrat +1
            [5] = 21236  -- Bocluamni +1
        }
        if (itemRate >= 50) then -- First drop is 50 in 100.
            player:addTreasure(lootTable[math.random(1,5)], mob);
        end
        if (itemRate >= 90) then -- You lucky high roller, 2nd drop is only 10 in 100
            player:addTreasure(lootTable[math.random(1,5)], mob);
        end
    end

    local CHANCE = 15;
    if (math.random(0,99) < CHANCE  and player:hasKeyItem(ATMA_OF_THE_WOULD_BE_KING) == false) then
        player:addKeyItem(ATMA_OF_THE_WOULD_BE_KING);
        player:messageSpecial(KEYITEM_OBTAINED, ATMA_OF_THE_WOULD_BE_KING);
    end
end;
