## Script
```lua
local DebugUtils = require('DBG_Main');
```
# Debug Utils
<p align="center">
    <img src="https://media.discordapp.net/attachments/664196963054518345/799991499920113664/Dbg.png"/>
</p>

# Docs

### islclosure
```lua
DebugUtils.islclosure(<function>)
```
returns true if function is lua closure,false if no

### iscclosure
```lua
DebugUtils.iscclosure(<function>)
```
returns true if function is C closure,false if no

### SetUps
```lua
DebugUtils.SetUps(<function>,<...> Value)
```
if function has only 1 upvalue, sets the upvalue.
if function has 2 or > then return all upvalues with index and asked what index to u want to set 




# Conclusion

lol this docs is piece of shit and tool too
retarded tool made by me in 10 minutes