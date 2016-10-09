-- edited ciga program

local monitor = peripheral.wrap("top")
monitor.clear()
 local x, y = monitor.getSize()
 print(y)

local function writeCentered( text, u )
  local m = monitor.getSize()
  local centerXPos = ( m - string.len(text) ) / 2
  monitor.setCursorPos( centerXPos + 1, u )
  monitor.print( text )
end

monitor.setTextScale(1)
monitor.setTextColor(colors.red)
writeCentered("Welcome to BossLand!", 4)

monitor.setTextColor(colors.green)
writeCentered("FREE POWER IS AVAILABLE!", 6)

monitor.setTextColor(colors.red)
writeCentered("- WARNING -", 8)
writeCentered("A resident tax between $1 and $50, but most likely $1, will be implemented eventually.", 9)
writeCentered("Players who are inactive for weeks and not contributing to the town taxes will be auto-kicked ", 10)

monitor.setTextColor(colors.white)
writeCentered("$75 per plot to claim, and $75 per plot every 24 hours for plot tax. There is currently no resident tax as of this message.", 11)
writeCentered("You can claim up to 4 consecutive plots at this point. If you need more plots, let us know. If you need to claim a plot in the Mining World, let us know.", 12)
writeCentered("No need to deposit money into the town because it automatically takes it from your /bal.", 13)
writeCentered("Keep an eye on your /bal and /towny time. Make money by using /vote and selling items on /market.", 14)
writeCentered("As far as building goes, please no huge towers in the sky. However, you are free to dig to build to bedrock.", 15)
writeCentered("There MUST be a 1 block border within the edge of your claim to allow for a walking path. But you are free to build underneath the path.", 16)
writeCentered("Please keep all functional blocks and items within your house, or underground, once it's built. I'd like to keep the community looking nice! Farms, of course, are allowed outside.", 17)

monitor.setTextColor(colors.red)
writeCentered("PLEASE keep all mining activities away from the town area.", 19)
writeCentered("Use /warp miningworld to go to the Mining World, duh. :D", 20)

for number = 1, x do
 monitor.setTextColor(colors.white)
 --1st row
 monitor.setCursorPos(number + 1,1)
 monitor.write("-")
 monitor.setCursorPos(number + 1,y)
 monitor.write("-")
 --2nd row
 monitor.setCursorPos(number - 1,2)
 monitor.write("-")
 monitor.setCursorPos(number - 1,y - 1)
 monitor.write("-")

end

for number = 1, y do
 monitor.setTextColor(colors.white)
 monitor.setCursorPos(1,number)
 monitor.write("||")
 monitor.setCursorPos(x - 1,number)
 monitor.write("||")
end
--crosses
for number = 1, x do
 monitor.setTextColor(colors.green)
 monitor.setCursorPos(2,y - 1)
 monitor.write("+")
 monitor.setCursorPos(x - 1 ,y -1)
 monitor.write("+")
 monitor.setCursorPos(x - 1,2)
 monitor.write("+")
 monitor.setCursorPos(2,2)
 monitor.write("+")
 --top
 monitor.setCursorPos(1,y)
 monitor.write("+")
 monitor.setCursorPos(x ,y)
 monitor.write("+")
 monitor.setCursorPos(x ,1)
 monitor.write("+")
 monitor.setCursorPos(1,1)
 monitor.write("+")
end
--fix edges
 monitor.setTextColor(colors.white)
 monitor.setCursorPos(2,1)
 monitor.write("-")
 monitor.setCursorPos(x - 1,1)
 monitor.write("-")
 monitor.setCursorPos(2,y)
 monitor.write("-")
 monitor.setCursorPos(x - 1,y)
 monitor.write("-")