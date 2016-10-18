-- Basic Auto-Door Lock --

sensor = peripheral.wrap("bottom")
side = "right"
owner = "DroMania"

while true do
  local players = sensor.getPlayers()
  local data = nil
  if players ~= nil then
    data = sensor.getPlayerByName(owner).all()
    -- debug.log(data) --
  elseif data.heldItem.display_name ~= nil then
    item = data.heldItem.display_name
    debug.log(item) -- 
  else
    item = "nothing"
    debug.log(item) --
  end
  for i = 1,#players do
   local pName = players[i].name
   if pName == owner and item == "Void Sword" then
     rs.setOutput(side,true)
     os.sleep(3)
   else
     rs.setOutput(side,false)
     os.sleep(1)
   end
  end
end