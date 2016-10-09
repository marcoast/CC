-- edited ciga program

local monitor = peripheral.wrap("top")
monitor.clear()
 local x, y = monitor.getSize()
 print(y)

local function writeCentered( text, u )
  local m = monitor.getSize()
  local centerXPos = ( m - string.len(text) ) / 2
  monitor.setCursorPos( centerXPos + 1, u )
  monitor.write( text )
end
monitor.setTextScale(1)
monitor.setTextColor(colors.red)
writeCentered("We also have some banned / restricted items on the server", 4)
writeCentered("All items that can bypass the protection plugin of this", 6)
writeCentered("server are banned until they can be fixed. Items that", 7)
writeCentered("also bypass the pvp protection are also banned. Items", 8)
writeCentered("that duplicate other items are also banned.", 9)
monitor.setTextColor(colors.yellow)
writeCentered("Any type of quarrying including turtles are restricted to", 12)
writeCentered("the mining world. You can find the teleporter at spawn.", 13)
monitor.setTextColor(colors.white)
writeCentered("You can find the banned / restricted items in the NEI", 16)
writeCentered("by typing 'Banned' / 'Restricted' into the NEI search-bar", 17)
writeCentered("You can also find a list of the banned / restricted items", 18)
writeCentered("on our forums on our website", 19)
monitor.setTextColor(colors.orange)
writeCentered("If you know any kind of dupe / glitch that we don't know", 22)
writeCentered("of, you can tell us and get rewarded", 23)


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