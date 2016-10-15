peripheral.call( "top", "listMethods" )

data = peripheral.call( "top", "getPlayers" )

peripheral.call( "top", "sonicScan" )

p1 = peripheral.call( "top", "getPlayerByName", "DroMania")

for k, v in pairs(tableVariable) do
  print(tostring(k)..": "..tostring(v))
end

