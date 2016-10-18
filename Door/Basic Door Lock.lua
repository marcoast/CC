-- Basic Auto-Door Lock --

local sensor = peripheral.wrap("bottom")
side = "right"
owner = "DroMania"

while true do
  rs.setOutput(side,false)
  local players = sensor.getPlayers()
  for i = 1,#players do
   local pName = players[i].name
   if pName == owner then
     rs.setOutput(side,true)
     os.sleep(3)
   else
     rs.setOutput(side,false)
     os.sleep(1)
   end
  end
end