local _
local ADDON, P = ...
local assert = _G.assert
local ACCEPT = _G.ACCEPT; assert(ACCEPT ~= nil,'ACCEPT')
local CANCEL = _G.CANCEL; assert(CANCEL ~= nil,'CANCEL')
local date = _G.date; assert(date ~= nil,'date')
local DELETE_ITEM_CONFIRM_STRING = _G.DELETE_ITEM_CONFIRM_STRING; assert(DELETE_ITEM_CONFIRM_STRING ~= nil,'DELETE_ITEM_CONFIRM_STRING')
local InCombatLockdown = _G.InCombatLockdown; assert(InCombatLockdown ~= nil,'InCombatLockdown')
local LibStub = _G.LibStub; assert(LibStub ~= nil,'LibStub')
local OKAY = _G.OKAY; assert(OKAY ~= nil,'OKAY')
local print = _G.print; assert(print ~= nil,'print')
local YES = _G.YES; assert(YES ~= nil,'YES')
local CSP = LibStub("AceAddon-3.0"):NewAddon(ADDON,"AceEvent-3.0","AceTimer-3.0","AceConsole-3.0")
_G.CSP = CSP -- into global space
CSP.private = P -- expose private space
function CSP:Verbose(...)
  if self.DB.verbose then print(("|cff7f7f7f%s|r [|cff00ffff%s|r]"):format(_G.ElvUI and "" or ("[" .. date("%H:%M") .. "]"),ADDON),...) end
end
function CSP:OnInitialize() -- app initialize
  self:InitEvents() -- register events
  self:ProfileLoad() -- initialize AceDB
  self:OptionsLoad() -- initialize AceConfig
end
local showWhich = {}
local blacklisted = {
  ["DANGEROUS_SCRIPTS_WARNING"] = true, -- it call protected function
  ["GARRISON_SHIP_RENAME"] = true, -- it make no sence, because name of ship need to be typed before confirm
  ["VOTE_BOOT_PLAYER"] = true, -- this I will not automate anyone can decide on his own
  ["CONFIRM_ARTIFACT_RESPEC"] = true, -- Respec cost power so no automation here
  ["REPLACE_ENCHANT"] = true, -- it call protected function
  ["SPELL_CONFIRMATION_PROMPT"] = true, -- sometime call protected function
  ["PET_BATTLE_FORFEIT_NO_PENALTY"] = true, -- another piece code moved to protected
  ["CONFIRM_DISENCHANT_ROLL"] = true, -- sorry but this addon is too simple minded to support this
  ["CONFIRM_LOOT_ROLL"] = true, -- sorry but this addon is too simple minded to support this
  ["CANCEL_AUCTION"] = true, -- another protected function CancelAuction() 
  ["CONFIRM_FOLLOWER_EQUIPMENT"] = true, -- 7.1.5 patch another protected function pain in ass
  ["GUILDBANK_WITHDRAW"] = true, -- dialog need fill-up number it can't be automated
  ["GUILDBANK_DEPOSIT"] = true, -- dialog need fill-up number it can't be automated
  ["WQA_LEAVE_GROUP"] = true, -- this is from 3rd party add-on and leave instance group is handled by default
  ["USE_NO_REFUND_CONFIRM"] = true, -- another option rendered unusable 7.3 hotfix
  ["BUYOUT_AUCTION"] = true, -- require interaction
  ["RENAME_PET"] = true, -- name need to be defined by user
  ["CONFIRM_LEAVE_BATTLEFIELD"] = true, -- in PvP you are on your own
}
function CSP:BackTimer()
  if InCombatLockdown() then return end -- only out-of combat is safe to simulate clicks
  for i = 1, 10 do
    local frame = _G["StaticPopup" .. i]
    if frame and frame.which and not blacklisted[frame.which] and frame.IsShown and frame:IsShown()  then
      local button = _G["StaticPopup" .. i .. "Button1"] -- /run local b = _G["StaticPopup1Button1"]; print(b)
      if button and button.IsShown and button:IsShown() then
        if not (button.GetText and (button:GetText() == CANCEL)) then -- static popup with single cancel button, like logout etc.
          if self.DB.popups[frame.which] or (_G.WoWBox and (frame.which == "BUYEMALL_CONFIRM")) then -- configured or personal app
            local editbox = _G["StaticPopup" .. i .. "EditBox"]
            if editbox and editbox.IsShown and editbox:IsShown() then -- fill in confirm edit box
              editbox:SetText(DELETE_ITEM_CONFIRM_STRING)
            end
            if button.Click then
              button:Click("LeftButton")
            end
          else
            if not showWhich[frame.which] then
              if (self.DB.popups[frame.which] == nil) then
                if button.GetText and ((button:GetText() == YES) or (button:GetText() == OKAY) or (button:GetText() == ACCEPT)) then
                  self:Verbose(frame.which,P.L["REQUEST"])
                end
              else
                if not _G.WoWBox then self:Verbose(frame.which,P.L["NOTENABLED"]) end
              end
            end
            showWhich[frame.which] = true
          end
        end
      end
    end
  end
end
