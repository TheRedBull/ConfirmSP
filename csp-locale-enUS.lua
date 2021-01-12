-- English localization file for enUS and enGB.
local ADDON = ...
local _ 
local assert = _G.assert
local LibStub = _G.LibStub; assert(LibStub ~= nil,'LibStub')
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale(ADDON, "enUS", true, false)
if not L then return end

L["TITLE"] = "Auto Confirm Static Popups"
L["AUTOANSWER"] = "Autoanswer"
L["VERBOSE"] = "Verbose output"
L["REQUEST"] = "\nNot supported... write it down and post on [https://github.com/TheRedBull/WOW_Auto-Confirm-Static-Popups/issues] for review."
L["NOTENABLED"] = "\nNot enabled in options."