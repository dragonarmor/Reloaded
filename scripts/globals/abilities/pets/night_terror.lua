---------------------------------------------------
-- night terror
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)

	local dINT = math.floor(pet:getStat(MOD_INT) - target:getStat(MOD_INT));
	local tp = skill:getTP();

	--note: this formula is only accurate for level 75 - 76+ may have a different intercept and/or slope
	local damage = math.floor(512 + 1.72*(tp+1));
	damage = damage + (dINT * 2.5);
	damage = MobMagicalMove(pet,target,skill,damage,ELE_DARK,1,TP_NO_EFFECT,0);
	damage = mobAddBonuses(pet, nil, target, damage.dmg, ELE_DARK);
	damage = AvatarFinalAdjustments(damage,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,1);

	target:delHP(damage);
	target:updateEnmityFromDamage(pet,damage);

	return damage;
end