--------------------------------------------------------------
-- func: @heroshop
-- desc: like @shop, but for accomplished adventurers only
--------------------------------------------------------------
require("scripts/globals/atma");
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/titles");
require("scripts/zones/Abyssea-Empyreal_Paradox/npcs/Prishe");
--------------------------------------------------------------
cmdprops =
{
    permission = 6,
    parameters = "i"
}; -- unfinished, will remove this comment and change permission when done


-- Notes:
--
-- ALWAYS comment your additions!


function onTrigger(player,page)

    if (page == 0 or page == nil) then
        player:PrintToPlayer( "Conquer content to unlock new @heroshop pages!");
        player:PrintToPlayer( "1: Nations, 2: Zilart, 3: CoP, 4: ToAU");
        player:PrintToPlayer( "5: WotG, 6: Abyssea, 7: Dynamis, 8: Legion");
        -- player:PrintToPlayer( "9: VoidWatch, 10: Walk of Echoes");
        return
    end

    local Sandy_clear = player:hasCompletedMission(SANDORIA,THE_HEIR_TO_THE_LIGHT);
    local Basty_clear = player:hasCompletedMission(BASTOK,WHERE_TWO_PATHS_CONVERGE);
    local Windy_clear = player:hasCompletedMission(WINDURST,MOON_READING);
    local Zilart_clear = player:hasCompletedMission(ZILART,AWAKENING);
    local Chains_clear = player:hasCompletedMission(COP,DAWN);
    local AhtUrgan_clear = player:hasCompletedMission(TOAU,THE_EMPRESS_CROWNED);
    local Goddess_clear = player:hasCompletedMission(WOTG,A_TOKEN_OF_TROTH);
    local Abyssea_clear = (countLunars(player) == 3 and title == 10);
    local Dyna_clearA = player:hasKeyItem(HYDRA_CORPS_BATTLE_STANDARD);
    local Dyna_clearB = player:hasKeyItem(DYNAMIS_TAVNAZIA_SLIVER);
    local Legion_clear = player:hasTitle(LEGENDARY_LEGIONNAIRE);
    local title = 0;

    if (player:hasTitle(BRIAREUS_FELLER)) then
        title = title+1;
    end
    if (player:hasTitle(KUKULKAN_DEFANGER)) then
        title = title+1;
    end
    if (player:hasTitle(GLAVOID_STAMPEDER)) then
        title = title+1;
    end
    if (player:hasTitle(ITZPAPALOTL_DECLAWER)) then
        title = title+1;
    end
    if (player:hasTitle(CIREINCROIN_HARPOONER)) then
        title = title+1;
    end
    if (player:hasTitle(SEDNA_TUSKBREAKER)) then
        title = title+1;
    end
    if (player:hasTitle(BENNU_DEPLUMER)) then
        title = title+1;
    end
    if (player:hasTitle(RESHEPH_ERADICATOR)) then
        title = title+1;
    end
    if (player:hasTitle(AMPHITRITE_SHUCKER)) then
        title = title+1;
    end
    if (player:hasTitle(WYRM_GOD_DEFIER)) then
        title = title+1;
    end

    if ((Sandy_clear == false or Basty_clear == true or Windy_clear == true) and Zilart_clear == true
    and Chains_clear == true and AhtUrgan_clear == true and Goddess_clear == true and Abyssea_clear == true
    and (Dyna_clearA == true or Dyna_clearB == true) and Legion_clear == true)
        player:PrintToPlayer( "Not so fast, Hercules, you have to complete some legendary labors before you can shop here!" );
        return
    end

    if (page == 1) then -- Unlocked by attaining rank 10 in all 3 nations.
        if (Sandy_clear == true and Basty_clear == true and Windy_clear == true) then
            local stock_1 =
            {
                15793,    1000000,    -- Anniversary Ring
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
            };
            showShop(player, STATIC, stock_1);
        end

    elseif (page == 2) then -- Unlocked by completing Rise of the Zilart.
        if (Zilart_clear == true) then
            local stock_2 =
            {
                14739,    5000000,    -- Suppanomimi
                14742,    5000000,    -- Beastly Earring
                14743,    5000000,    -- Bushinomimi
                14740,    5000000,    -- knights earring
                14741,    5000000,    -- abyssal earring
            };
            showShop(player, STATIC, stock_2);
        end

    elseif (page == 3) then -- Unlocked by completing Chains of Promathia.
        if (Chains_clear == true) then
            local stock_3 =
            {
                15545,    5000000,    -- Tamas Ring
                15543,    5000000,    -- Rajas Ring
                15544,    5000000,    -- Sattva Ring
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
            };
            showShop(player, STATIC, stock_3);
        end

    elseif (page == 4) then -- Unlocked by completing Treasures of Aht Urgan.
        if (AhtUrgan_clear == true) then
            local stock_4 =
            {
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
            };
            showShop(player, STATIC, stock_4);
        end

    elseif (page == 5) then -- Unlocked by completing Wings of the Goddess.
        if (Goddess_clear == true) then
            local stock_5 =
            {
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
            };
            showShop(player, STATIC, stock_5);
        end

    elseif (page == 6) then -- Unlocked by completing all of Abyssea.
        if (Abyssea_clear == true) then
            local stock_6 =
            {
                11362,    5000000,    -- Twilight Mail
                11363,    5000000,    -- Twilight Cloak
                15959,    1000000,    -- Twilight Belt
                18551,    1000000,    -- Twilight Scythe
                11625,    1000000,    -- Twilight Torque
                11798,    3000000,    -- Twilight Helm
                19132,    1000000,    -- Twilight Knife
                16259,    1000000,    -- Twilight Cape
                5877,     100000,       -- Terror Screen
                5879,     100000,       -- Doom Screen
            };
            showShop(player, STATIC, stock_6);
        end

    elseif (page == 7) then -- Unlocked by clearing every Dynamis zone.
        -- if (player:getVar(MyVariableName) == 1) then
            local stock_7 =
            {
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
            };
            showShop(player, STATIC, stock_7);
        -- end

    elseif (page == 8) then -- Unlocked by clearing every Legion battle.
        if (Legion_clear == true) then
            local stock_8 =
            {
                21337,    7000,    -- achiyal-bullet
                21307,    7000,    -- achiyal-arrow
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
                -- ItemID,    Price,    -- Item Name
            };
            showShop(player, STATIC, stock_8);
        end

    else
        player:PrintToPlayer( string.format( "Page %i not found.", page ) );
    end

end;