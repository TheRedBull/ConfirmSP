# Auto Confirm Static Popups
## About
As a fan of the functionality this addon provides, I'm updating it to support Shadowlands!

## Credits
All credit to this addon goes to the original author - I only cleaned it up a bit and made it work in Shadowlands

## Installation
Download and remane the top-level folder to ConfirmSP then move the folder to your WoW addons folder

## Known Limitations
With the current version, only two functions seem to be unstable, namely DELETE_ITEM and DELETE_GOOD_ITEM. The original flow would confirm the item deletion but the button click function has bee updated in 9.0+ so this is curently broken. While the deletion confirmation for DELETE_GOOD_ITEM still works, the button is not clicked. While this doesn't address the full scope of this addon, you don't need to type the confirmantion at this time but you do have to click the button manually - for the time, a chat message will be shown to remind you to click. The message is serving two functions: 1) a placeholder in the code and 2) to suppress any additional errors

###Workaround
By installing Easy Delete Confirm (https://www.curseforge.com/wow/addons/easydeleteconfirm) the need to type 'delete' is removed and this addon does the rest of the lifting as expected. Until a time when this functionality _may_ be added, it is strongly recommended to install Easy Delete as a companion addon.

## Version
**0.21-07-06.1**
- Updated for 9.1
- Adds support for new auto-confirm properties

**0.21-02-17.1**
- Additional changes to fix some functionality

**0.21-02-11.1**
- Suppress LUA errors by removing the 'button click' for item deletion
- Additional changes to further debug limitations for deleting items (see Known Limitations section for more info)

**0.21-01-12.2**
- Added [TOMTOM_REMOVE_ALL_CONFIRM]

**0.21-01-12.1**
- Initial refactor for 9.x


---

##### For Original Version History, see [csp-revision.lua](https://github.com/TheRedBull/WOW_Auto-Confirm-Static-Popups/blob/main/csp-revision.lua)
