term.clear()
term.setCursorPos(1,1)

local modem = peripheral.wrap("top") -- Wrap top modem.
modem.open(281,713,832)
local mon = peripheral.wrap("right") -- Wrap monitor.

local function monCl() -- Clears the monitor.
  mon.clear()
  mon.setCursorPos(1,1)
end

local function receive() -- Receives the message to print.
  event,modemSide,senderChannel,replyChannel,
  data,senderDistance = os.pullEvent("modem_message")
  print("Message received from channel #"..senderChannel)
  print("Sending computer ID on channel #"..replyChannel)
  local id = os.getComputerID()
  modem.transmit(replyChannel,senderChannel,id)
  modem.open(id)
  print("Confirmation sent.") -- Server doesn't seem to receive the data (10/11/16)
  return data
end

local function screen() -- Prints the received message onto the monitor
  mon.setTextScale(size)
  mon.setTextColor( colors[col] )
  -- [col] is the same as .col --
  mon.setBackgroundColor( colors[bgcol] )
  local mon1 = term.redirect(mon) -- # Allows for easier wrapping of the text onscreen.
  print(msg)
  term.redirect(mon1)
end

while true do
  print("Waiting on message....\n")
  receive(data)
  msg,size,col,bgcol = data[1],data[2],data[3],data[4]
  print("Message:\n")
  print(msg)

  -- print("Table: \n" .. textutils.serialize(data) ) -- temporary code | To see all data received
  
  print()
  monCl()
  screen()
end