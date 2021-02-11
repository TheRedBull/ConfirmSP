# Auto Confirm Static Popups
## About
As a fan of the functionality this addon provides, I'm updating it to support Shadowlands!

## Credits
All credit to this addon goes to the original author - I only cleaned it up a bit and made it work in Shadowlands

## Known Limitations
With the current version, only two functions seem to be unstable, namely DELETE_ITEM and DELETE_GOOD_ITEM. The original flow would confirm the item deletion but the button click function has bee updated in 9.0+ so this is curently broken. While the deletion confirmation for DELETE_GOOD_ITEM still works, the button is not clicked. While this doesn't address the full scope of this addon, you don't need to type the confirmantion at this time but you do have to click the button manually - for the time, a chat message will be shown to remind you to click. The message is serving two functions: 1) a placeholder in the code and 2) to suppress any 

## Version
**0.21-02-11.1**
- Suppress LUA errors by removing the 'button click' for item deletion
- Additional changes to further debug limitations for deleting items (see Known Limitations section for more info)

**0.21-01-12.2**
- Added [TOMTOM_REMOVE_ALL_CONFIRM]

**0.21-01-12.1**
- Initial refactor for 9.x


---

##### For Original Version History, see [csp-revision.lua](https://github.com/TheRedBull/WOW_Auto-Confirm-Static-Popups/blob/main/csp-revision.lua)
