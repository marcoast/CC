term.clear()
term.setCursorPos(1,1)
-------------------------------------------------
local modem = peripheral.wrap("top")
modem.open(281,713,832)
local mon = peripheral.wrap("right")
-------------------------------------------------
local function receive() -- Receives the message to print.
  event,modemSide,senderChannel,replyChannel,
  data,senderDistance = os.pullEvent("modem_message")
  local id = os.getComputerID()
  modem.transmit(replyChannel,senderChannel,id) -- Server doesn't seem to receive the data (10/11/16)
  modem.open(id)
  return data
end

local function screen() -- Prints the received message onto the monitor
  mon.setTextScale(size)
  mon.setTextColor(colors[col])
  -- [col] is the same as .col --
  mon.setBackgroundColor(colors[bgcol])
  mon.clear()
end

local function centerText(msg) -- Centers text on monitor only
  local x,y = mon.getSize()
  local centerXPos = math.ceil( x/2 - string.len(msg)/2 )
  local centerYPos = ( y / 2)
  mon.setCursorPos( centerXPos, centerYPos )
  ------- Debugging variables -------------------
  -- print("X" .. centerXPos .. "Y " .. centerYPos)
  -----------------------------------------------
  local mon1 = term.redirect(mon) -- # Allows for character wrapping of the text. 
  print(msg) -- # Upgrade to word wrapping next.
  term.redirect(mon1)
end

while true do
  print("Waiting on message....\n")
  receive(data)
  msg,size,col,bgcol = data[1],data[2],(data[3]),(data[4])
  print("Message:\n" .. msg .. "\n" .. "Table: \n" .. textutils.serialize(data) .. "\n" )
  mon.clear()
  mon.setCursorPos(1,1)
  screen()
  centerText(msg)
end
