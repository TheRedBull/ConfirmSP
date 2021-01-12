--[[<p>Version: 02.16 YMD: 2018.12.16</p>
</ul>
<li>TOC bump.</li>
</ul>
]]
--[[<p>Version: 02.14 YMD: 2018.09.21</p>
</ul>
<li>LINT for all local including assert.</li>
<li>Added CLIENT_RESTART_ALERT, CONFIRM_AZERITE_EMPOWERED_SELECT_POWER, PETRENAMECONFIRM.</li>
<li>Added BUYOUT_AUCTION to blacklist is protected.</li>
<li>Added RENAME_PET to blacklist because it need name pet 1st.</li>
</ul>
]]
--[[<p>Version: 02.12 YMD: 2018.07.18</p>
</ul>
<li>Push TOC to 8.0.1 build.</li>
<li>Fixed global leak for key and code is now LINT copliant to use only local variables.</li>
</ul>
]]
--[[<p>Version: 02.10 YMD: 2018.07.06</p>
</ul>
<li>Updated libraries for compatibility with WoW BFA beta.</li>
</ul>
]]
--[[<p>Version: 02.08 YMD: 2017.10.04</p>
</ul>
<li>Blacklisted WQA_LEAVE_GROUP and USE_NO_REFUND_CONFIRM, 1st is 3rd party addon and 2nd is another protected function.</li>
<li>Added CONFIRM_SUMMON.</li>
</ul>
]]
--[[<p>Version: 02.06 YMD: 2017.09.18</p>
</ul>
<li>Implemented USE_NO_REFUND_CONFIRM, CONFIRM_RELIC_TALENT.</li>
</ul>
]]
--[[<p>Version: 02.04 YMD: 2017.08.31</p>
</ul>
<li>Implemented LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS, CALENDAR_ERROR, CONFIRM_REPORT_SPAM_CHAT, BATTLE_PET_PUT_IN_CAGE, WORLD_QUEST_ENTERED_PROMT and EXPERIMENTAL_CVAR_WARNING. Some of them are from 3rd party addons not from Blizzard. I never seen Static popup from these. All these are disabled by default and need to be enabled. I never had chance to test them, if these does call protected function, then it will not work. Please, I need feedback.
</ul>
]]
--[[<p>Version: 02.02 YMD: 2017.08.29</p>
<ul>
<li>TOC update for 7.3 patch and new milenia version.</li>
<li>ACE3 libs refresh to latest release.</li>
</ul>
]]
--[[<p>Version: 01-42 YMD: 2017.03.29</p>
<ul>
<li>Guild bank money deposit and withdraw make no sense to automate.</li>
<li>ACE3 libs refresh to latest release.</li>
</ul>
]]
--[[<p>Version: 01-40 YMD: 2017.01.17</p>
<ul>
<li>Removed CANCEL_AUCTION and CONFIRM_FOLLOWER_EQUIPMENT it call protected function pain in ass Blizzard, why protected?</li>
</ul>
]]
--[[ Version: 01-38 YMD: 2016.10.30

[list][*]Blacklisted REPLACE_ENCHANT, SPELL_CONFIRMATION_PROMPT and PET_BATTLE_FORFEIT_NO_PENALTY another call to protected function past 7.1 patch, thank you Blizzard.
[*]Added BUYEMALL_CONFIRM, CONFIRM_FOLLOWER_TEMPORARY_ABILITY, CANCEL_AUCTION and CONFIRM_RELIC_REPLACE.
[*]Blacklisted frames are checked as 1st no need to go further if can't be supported.[/list]

]]
--[[ Version: 01-36 YMD: 2016.10.27

[list][*]Added CONFIRM_PLAYER_CHOICE, ORDER_HALL_TALENT_RESEARCH, PARTY_INVITE, NOT_ENOUGH_POWER_ARTIFACT_RESPEC and GOSSIP_CONFIRM.
[*]Static popup with ACCEPT is now supported.
[*]Legion patch 7.1 compatible.
[*]Some static popups are blacklisted like DANGEROUS_SCRIPTS_WARNING it can't be scripted it contains protected function call. GARRISON_SHIP_RENAME it make no sence, because name of ship need to be typed before confirm. VOTE_BOOT_PLAYER this I will not automate anyone can decide on his own. CONFIRM_ARTIFACT_RESPEC respec cost power so no automation here.[/list]

]]
--[[ Version: 01-34 YMD: 2016.10.02

[list][*]Added CONFIRM_RESET_TO_DEFAULT_KEYBINDINGS, PREMADEFILTER_CONFIRM_CLOSE, PETBM_DELETE_TEAM, PET_BATTLE_FORFEIT_NO_PENALTY, CONFIRM_ACCEPT_SOCKETS and TRADE_POTENTIAL_REMOVE_TRANSMOG.[/list]

]]
--[[ Version: 01-32 YMD: 2016.09.04

[list][*]Added DELETE_QUEST_ITEM, CONFIRM_FOLLOWER_EQUIPMENT and CONFIRM_SAVE_EQUIPMENT_SET.[/list]

]]
--[[ Version: 01-30 YMD: 2016.08.31

[list][*]SPELL_CONFIRMATION_PROMPT for now is disabled by default, because there are reports that confirm cause taint problem. Until I see if this pop-up really using secured function, then can't be handled by my addon.[/list]

]]
--[[ Version: 01-28 YMD: 2016.08.21

[list][*]Added CONFIRM_BUY_BANK_SLOT, CONFIRM_BUY_REAGENTBANK_TAB, TRANSMOG_APPLY_WARNING, REPLACE_ENCHANT, VOID_DEPOSIT_CONFIRM, EQUIP_BIND_TRADEABLE, and CONFIM_BEFORE_USE[/list]

]]
--[[ Version: 01-26 YMD: 2016.07.25

[list][*]DANGEROUS_SCRIPTS_WARNING is blacklisted because it can't be implemented. Blizzard implemented function as protected. So it will nag all macro users who run scripts in macros.
[*]Added TALENTS_INVOLUNTARILY_RESET, CONFIRM_DELETE_TRANSMOG_OUTFIT, CONFIRM_DELETE_EQUIPMENT_SET, CONFIRM_RECRUIT_FOLLOWER, DEACTIVATE_FOLLOWER, CONFIRM_DELETE_SELECTED_MACRO, CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL, SPELL_CONFIRMATION_PROMPT, RESURRECT_NO_TIMER, RECOVER_CORPSE, DEATH, OUTFITTER_CONFIRM_SET_CURRENT, and LOOT_BIND[/list]

]]
--[[ Version: 01-24 YMD: 2016.07.19

[list][*]Added SEND_MONEY.
TOC update for Legion patch 7.0.3[/list]

]]
--[[ Version: 01-22 YMD: 2016.07.13

[list][*]Fix fatal test preventing confirm any configured pop-up.
[*]Added CONFIRM_REMOVE_FRIEND.[/list]

]]
--[[ Version: 01-20 YMD: 2016.07.12

[list][*]Added CONFIRM_LEARN_SPEC.
[*]Detection of static pop-up just with single "Cancel" button, it will not be hinted for adding into this addon.[/list]

]]
--[[ Version: 01-18 YMD: 2016.07.12

[list][*]Added ABANDON_QUEST_WITH_ITEMS.
[*]Options are now sorted by static pop-up constant name.[/list]

]]
--[[ Version: 01-16 YMD: 2016.07.03

[list][*]Verbose output now prints only message when static-popup is not enabled in config or is not supported with instruction how to request implementation.[/list]

]]
--[[ Version: 01-14 YMD: 2016.06.26

[list][*]Added ABANDON_QUEST,DANGEROUS_MISSIONS.
[*]Fix verbose output for not supported static pop-up with instructions how-to request changes in my addon.[/list]

]]
--[[ Version: 01-12 YMD: 2016.06.21

[list][*]In verbose mode, for not supported static popups will be printed to chat constant used in presented static popup. This ease mode for adding new supported static popups. Just write constant and I will add it into next release.[/list]

]]
--[[ Version: 01-10 YMD: 2016.06.18

[list][*]Added AUTOEQUIP_BIND for BoE items.[/list]

]]
--[[ Version: 01-08 YMD: 2016.06.13

[list][*]Fix, correct load order for AceGUI and AceConfig libraries.[/list]

]]
--[[ Version: 01-06 YMD: 2016.06.08

[list][*]Added DELETE_GOOD_ITEM it auto-fill DELETE into edit box. You are warned if enable it and then drop your rare, epic or legendary item it will get instantly lost!
[*]Added VOID_STORAGE_DEPOSIT_CONFIRMATION.[/list]

]]
--[[ Version: 01-04 YMD: 2016.05.22

[list][*]Added CONFIRM_RESET_INSTANCES.
[*]Added CONFIRM_MAIL_ITEM_UNREFUNDABLE.[/list]

]]
--[[ Version: 01-02 YMD: 2016.04.09

[list][*]Redesigned defaults for pop-ups some need to be enabled, because can be dangerous. Enable it at own will, like auto-confirm on delete.[/list]

]]
--[[ Version: 01-00 YMD: 2016.04.08

[list][*]Initial design.[/list]

]]
--[[Description:
Are you tired to answering certain static popups by clicking "Yes" or "Okay" button every-time you buy item for token or you leaving instance group? This add-on automatically click on "yes" and dismiss static pop-ups like buy items for token, sell items to refund tokens, leave instance party etc. These static pop-ups can be configured for auto-answering (pick&click "yes" button) some "danger" are disabled by default, enable them on your own risk.

Supported pop-ups:

[list][*]ABANDON_QUEST and ABANDON_QUEST_WITH_ITEMS enabled by default
[*]ACTIVATE_FOLLOWER enabled by default
[*]AUTOEQUIP_BIND enabled by default
[*]BUYEMALL_CONFIRM disabled by default
[*]CONFIM_BEFORE_USE disabled by default
[*]CONFIRM_ACCEPT_SOCKETS enabled by default
[*]CONFIRM_BINDER disabled by default
[*]CONFIRM_BUY_BANK_SLOT enabled by default
[*]CONFIRM_BUY_REAGENTBANK_TAB enabled by default
[*]CONFIRM_DELETE_EQUIPMENT_SET enabled by default
[*]CONFIRM_DELETE_SELECTED_MACRO enabled by default
[*]CONFIRM_DELETE_TRANSMOG_OUTFIT enabled by default
[*]CONFIRM_FOLLOWER_TEMPORARY_ABILITY enabled by default
[*]CONFIRM_FOLLOWER_UPGRADE enabled by default
[*]CONFIRM_HIGH_COST_ITEM disabled by default
[*]CONFIRM_LEARN_SPEC enabled by default
[*]CONFIRM_LEAVE_INSTANCE_PARTY enabled by default
[*]CONFIRM_MAIL_ITEM_UNREFUNDABLE disabled by default
[*]CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL enabled by default
[*]CONFIRM_PLAYER_CHOICE enabled by default
[*]CONFIRM_PURCHASE_NONREFUNDABLE_ITEM disabled by default
[*]CONFIRM_PURCHASE_TOKEN_ITEM enabled by default
[*]CONFIRM_RECRUIT_FOLLOWER enabled by default
[*]CONFIRM_REFUND_TOKEN_ITEM enabled by default
[*]CONFIRM_RELIC_REPLACE disabled by default
[*]CONFIRM_REMOVE_FRIEND enabled by default
[*]CONFIRM_RESET_INSTANCES enabled by default
[*]CONFIRM_RESET_TO_DEFAULT_KEYBINDINGS enabled by default
[*]CONFIRM_SAVE_EQUIPMENT_SET enabled by default
[*]CONFIRM_UPGRADE_ITEM enabled by default
[*]DANGEROUS_MISSIONS enabled by default
[*]DEACTIVATE_FOLLOWER enabled by default
[*]DEATH disabled by default
[*]DELETE_GOOD_ITEM delete rare, epic and legendary item where need to be typped in DELETE (or localized variant) to confirm delete disabled by default.
[*]DELETE_ITEM delete all items except rare, epic and legendary disabled by default
[*]DELETE_QUEST_ITEM disabled by default
[*]EQUIP_BIND enabled by default
[*]EQUIP_BIND_TRADEABLE disabled by default
[*]GOSSIP_CONFIRM enabled by default
[*]LOOT_BIND enabled by default
[*]NOT_ENOUGH_POWER_ARTIFACT_RESPEC enabled by default
[*]ORDER_HALL_TALENT_RESEARCH disabled by default
[*]OUTFITTER_CONFIRM_SET_CURRENT enabled by default
[*]PARTY_INVITE disabled by default
[*]PETBM_DELETE_TEAM enabled by default
[*]PREMADEFILTER_CONFIRM_CLOSE enabled by default
[*]RECOVER_CORPSE disabled by default
[*]RESURRECT_NO_TIMER disabled by default
[*]SENDMONEY disabled by default
[*]TALENTS_INVOLUNTARILY_RESET enabled by default
[*]TRADE_POTENTIAL_REMOVE_TRANSMOG enabled by default
[*]TRANSMOG_APPLY_WARNING disabled by default
[*]VOID_DEPOSIT_CONFIRM disabled by default
[*]VOID_STORAGE_DEPOSIT_CONFIRMATION disabled by default[/list]

]]
--[[Known issues:

[list][*]None.[/list]

]]
--[[To-Do:

[list][*]Empty.[/list]

]]
--[[ Version: 01-39 YMD: 2016.10.31

[list][*].[/list]

]]
