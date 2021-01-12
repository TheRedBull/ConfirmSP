--[[ Event handlers ]]
local _
local assert = _G.assert
local ADDON, P = ...
local LibStub = _G.LibStub; assert(LibStub ~= nil,'LibStub')
--
local CSP = LibStub("AceAddon-3.0"):GetAddon(ADDON)
function CSP:InitEvents()
  self:RegisterEvent("PLAYER_LOGIN")
end
function CSP:PLAYER_LOGIN() -- player entering game
  if not self.DB["version"] or (self.DB["version"] ~= P.VERSION) then self:Verbose("|cFFFF0000" .. P.TITLE .. " " .. P.VERSION); self.DB["version"] = P.VERSION; end
  if not self.backTimer then self.backTimer = self:ScheduleRepeatingTimer("BackTimer", P.TIMER) end -- slow backing timer monitoring popups
end
