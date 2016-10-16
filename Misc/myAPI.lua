-- My API --
local sensor = peripheral.wrap("openperipheral_sensor_10")
local monitor = peripheral.wrap("monitor_287")
local maindrive = peripheral.wrap("drive_353")
local copydrive = peripheral.wrap("drive_352")


function clearMon()
  monitor.clear()
  monitor.setCursorPos(1,1)
end
 
function scanPlayers()
   players = sensor.getPlayers()
   for i = 1,#players do
   	print( sensor.getPlayerByName(players[i]["name"]) )
	end	
end 
 
function toMon()
  oldTerm = term.redirect(monitor)
end
 
function toTerm()
  term.redirect(oldTerm)
end
