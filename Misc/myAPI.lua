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
   local players = sensor.getPlayers()
   write("Enter player name: ")
   name = read()
   pData = sensor.getPlayerByName(name)
   return pData
 end 
 
function toMon()
  oldTerm = term.redirect(monitor)
end
 
function toTerm()
  term.redirect(oldTerm)
end
