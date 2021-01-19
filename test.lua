local DebugUtils = require('DBG_Main');

local bye = 'bye';
local hi = 'hi';

function bye_fn()
    return bye,hi;
end;

DebugUtils.SetUps(bye_fn,'good morning')

print(bye_fn())