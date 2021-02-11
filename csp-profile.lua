--[[ LUA variables in WTF ]]
local _
local ADDON, P = ...
local assert = _G.assert
local LibStub = _G.LibStub; assert(LibStub ~= nil,'LibStub')
local pairs = _G.pairs; assert(pairs ~= nil,'pairs')
local table = _G.table; assert(table ~= nil,'table')
local CSP = LibStub("AceAddon-3.0"):GetAddon(ADDON)
function CSP:ProfileChanged() -- LUA stored variables changed
  self.DB = self.AceDB.profile
end
local defaults = {
  profile = {
    popups = {
      ["ABANDON_QUEST"] = true,
      ["ABANDON_QUEST_WITH_ITEMS"] = true,
      ["ACTIVATE_FOLLOWER"] = true,
      ["AUTOEQUIP_BIND"] = true,
      ["BATTLE_PET_PUT_IN_CAGE"] = false,
      ["BUYEMALL_CONFIRM"] = false,
      ["BUYOUT_AUCTION"] = false,
      ["CALENDAR_ERROR"] = false,
      ["CLIENT_RESTART_ALERT"] = true,
      ["CONFIM_BEFORE_USE"] = false,
      ["CONFIRM_ACCEPT_SOCKETS"] = true,
      ["CONFIRM_AZERITE_EMPOWERED_SELECT_POWER"] = true,
      ["CONFIRM_BINDER"] = false,
      ["CONFIRM_BUY_BANK_SLOT"] = true,
      ["CONFIRM_BUY_REAGENTBANK_TAB"] = true,
      ["CONFIRM_DELETE_EQUIPMENT_SET"] = true,
      ["CONFIRM_DELETE_SELECTED_MACRO"] = true,
      ["CONFIRM_DELETE_TRANSMOG_OUTFIT"] = true,
      ["CONFIRM_FOLLOWER_TEMPORARY_ABILITY"] = true,
      ["CONFIRM_FOLLOWER_UPGRADE"] = true,
      ["CONFIRM_HIGH_COST_ITEM"] = false, 
      ["CONFIRM_LEARN_SPEC"] = true,
      ["CONFIRM_LEAVE_INSTANCE_PARTY"] = true,
      ["CONFIRM_MAIL_ITEM_UNREFUNDABLE"] = false,
      ["CONFIRM_MERCHANT_TRADE_TIMER_REMOVAL"] = true,
      ["CONFIRM_PLAYER_CHOICE"] = true,
      ["CONFIRM_PROFESSION"] = true,
      ["CONFIRM_PURCHASE_NONREFUNDABLE_ITEM"] = false,
      ["CONFIRM_PURCHASE_TOKEN_ITEM"] = true,
      ["CONFIRM_RECRUIT_FOLLOWER"] = true,
      ["CONFIRM_REFUND_TOKEN_ITEM"] = true,
      ["CONFIRM_RELIC_REPLACE"] = false,
      ["CONFIRM_RELIC_TALENT"] = false,
      ["CONFIRM_REMOVE_FRIEND"] = true,
      ["CONFIRM_REPORT_SPAM_CHAT"] = false,
      ["CONFIRM_RESET_INSTANCES"] = true,
      ["CONFIRM_RESET_TO_DEFAULT_KEYBINDINGS"] = true,
      ["CONFIRM_SAVE_EQUIPMENT_SET"] = true,
      ["CONFIRM_SUMMON"] = false,
      ["CONFIRM_UPGRADE_ITEM"] = true,
      ["DANGEROUS_MISSIONS"] = true,
      ["DEACTIVATE_FOLLOWER"] = true,
      ["DEATH"] = false,
      ["DELETE_GOOD_ITEM"] = false,
      ["DELETE_ITEM"] = false,
      ["DELETE_QUEST_ITEM"] = false,
      ["EQUIP_BIND"] = true,
      ["EQUIP_BIND_TRADEABLE"] = false,
      ["EXPERIMENTAL_CVAR_WARNING"] = false,
      ["GOSSIP_CONFIRM"] = true,
      ["LFG_LIST_ENTRY_EXPIRED_TOO_MANY_PLAYERS"] = false,
      ["LFG_OFFER_CONTINUE"] = true,
      ["LOOT_BIND"] = true,
      ["LOOT_BIND_CONFIRM"] = true,
      ["NOT_ENOUGH_POWER_ARTIFACT_RESPEC"] = true,
      ["ORDER_HALL_TALENT_RESEARCH"] = false,
      ["OUTFITTER_CONFIRM_SET_CURRENT"] = true,
      ["PARTY_INVITE"] = false,
      ["PETBM_DELETE_TEAM"] = true,
      ["PETRENAMECONFIRM"] = true,
      ["PREMADEFILTER_CONFIRM_CLOSE"] = true,
      ["RECOVER_CORPSE"] = false,
      ["RESURRECT_NO_TIMER"] = false,
      ["SEND_MONEY"] = false,
      ["TALENTS_INVOLUNTARILY_RESET"] = true,
      ["TOMTOM_REMOVE_ALL_CONFIRM"] = true,
      ["TRADE_POTENTIAL_REMOVE_TRANSMOG"] = true,
      ["TRANSMOG_APPLY_WARNING"] = false,
      ["VOID_DEPOSIT_CONFIRM"] = false,
      ["VOID_STORAGE_DEPOSIT_CONFIRMATION"] = false,
      ["WORLD_QUEST_ENTERED_PROMT"] = false,
    },
    verbose = true,
    negative = false,
  },
}
function CSP:ProfileLoad() -- LUA stored variables load and init
  self.AceDB = LibStub("AceDB-3.0"):New("ConfirmSP",defaults,true) -- true means 'Default'
  self.AceDB.RegisterCallback(self, "OnProfileChanged", "ProfileChanged")
  self.AceDB.RegisterCallback(self, "OnProfileCopied",  "ProfileChanged")
  self.AceDB.RegisterCallback(self, "OnProfileReset",   "ProfileChanged")
  self.DB  = self.AceDB.profile
end
-- next functions are taken from http://lua-users.org/wiki/SortedIteration, because I need sorted order for options table by key not by insertion
local function __genOrderedIndex(t)
  local orderedIndex = {}
  for key in pairs(t) do table.insert(orderedIndex, key) end
  table.sort(orderedIndex)
  return orderedIndex
end
local function orderedNext(t, state)
  local key = nil
  if state == nil then
    t.__orderedIndex = __genOrderedIndex( t )
    key = t.__orderedIndex[1]
  else
    for i = 1,table.getn(t.__orderedIndex) do
      if t.__orderedIndex[i] == state then
        key = t.__orderedIndex[i+1]
      end
    end
  end
  if key then
    return key, t[key]
  end
  t.__orderedIndex = nil
  return
end
local function orderedPairs(t)
  return orderedNext, t, nil
end
local function PopupOptions()
  local args, index = {}, 1
  for key, val in orderedPairs(defaults.profile.popups) do -- put options sorted order by pop-up constant name
    args[key] = {
      name = key,
      desc = _G[key],
      order = index,
      type = "toggle",
      width = "full", 
      set = function(info,val) CSP.DB.popups[info[#info]] = val; end,
      get = function(info) if CSP.DB.popups[info[#info]] ~= nil then return CSP.DB.popups[info[#info]] end; return false; end, 
    }
    index = index + 1
  end
  return args
end
function CSP:OptionsLoad() -- load options for UI config
  local ConfirmSPOptions = {
    type = "group",
    args = {
      ver = {
        name = P.VERSION,
        type = "header",
        order = 0,
        width = "full",    
      },
      verbose = {
        name = P.L["VERBOSE"],
        order = 2,
        type = "toggle",
        width = "full", 
        set = function(info,val) CSP.DB.verbose = val; end,
        get = function(info) if CSP.DB.verbose ~= nil then return CSP.DB.verbose end; return true; end, 
      },
      toggle = {
        order = 3,
        name = P.L["AUTOANSWER"],
        type = "group",
        args = PopupOptions(),
      },
    },
  }
  ConfirmSPOptions.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.AceDB)
  LibStub("AceConfig-3.0"):RegisterOptionsTable(P.TITLE, ConfirmSPOptions)
  LibStub("AceConfigDialog-3.0"):AddToBlizOptions(P.TITLE,ADDON,nil)
end
