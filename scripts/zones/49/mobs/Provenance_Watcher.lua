-----------------------------------
-- Area: Provenance
-- VWNM: Provenance_Watcher
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAGIC_COOL, 25);
    mob:setMobMod(MOBMOD_DRAW_IN, 2);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- setMod
    mob:setMod(MOD_REGEN, 100);
    mob:setMod(MOD_REGAIN, 10);
    mob:setMod(MOD_REFRESH, 250);
    mob:setMod(MOD_UFASTCAST, 55);
    mob:setMod(MOD_MACC,2500);
    mob:setMod(MOD_MATT,90);
    -- mob:SetMobSkillAttack(LIST_ID_HERE);
end;

-----------------------------------
-- onMobEngage Action
-----------------------------------

function onMobEngaged(mob, target)
end;

-----------------------------------
-- onMobWeaponSkill Action
-----------------------------------

function onMobWeaponSkill(target, mob, skill)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local Form_Change = mob:getLocalVar("PW_Form");
    -- This should change twice once at 75% for 2 wing form and then again at 50% for 4 wing form.
    -- Currently cant find animation sub for 2 wing mode, will add in once I can figure it out.
    -- Also need to sort a check for fetters up to adjust dmg taken.
    if (mob:getHPP() <= 50) then
        if (Form_Change == 0) then
            mob:AnimationSub(2);
            mob:setLocalVar("PW_Form", 1);
        end
    end
end;

-----------------------------------
-- onSpellPrecast
-----------------------------------

function onSpellPrecast(mob, spell)
    if (spell:getID() == 252) then -- Stun
        spell:setAoE(SPELLAOE_RADIAL);
        spell:setFlag(SPELLFLAG_HIT_ALL);
        spell:setRadius(30);
    elseif (spell:getID() == 286) then -- Addle
        spell:setAoE(SPELLAOE_RADIAL);
        spell:setFlag(SPELLFLAG_HIT_ALL);
        spell:setRadius(30);
    end
end;

-----------------------------------
-- onSpellCast
-----------------------------------

function onSpellCast(caster,target,spell)
    -- Need to check for any spell landing then random chance fetter pop.
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;