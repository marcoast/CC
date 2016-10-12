term.clear()
term.setCursorPos(1,1)

modem = peripheral.wrap("top") -- Wrap top modem.
modem.open(281,713,832) 
mon = peripheral.wrap("right") -- Wrap monitor.

function monCl() -- Clears the monitor.
  mon.clear()
  mon.setCursorPos(1,1)
end

function receive() -- Receives the message to print.
  event,modemSide,senderChannel,replyChannel,
  data,senderDistance = os.pullEvent("modem_message")
  print("Message received from channel #"..senderChannel)
  print("Sending confirmation message on channel #"..replyChannel)
  modem.transmit(replyChannel,senderChannel,replyChannel)
  print("Confirmation sent.") -- Server doesn't seem to receive the data (10/11/16) 
  return data
end

function screen() -- Prints the received message onto the monitor
  mon
  mon.setTextScale(size)
  col
  local mon1 = term.redirect(mon)
  print(msg)
  term.redirect(mon1)
end

while true do
  print("Waiting on message....\n")
  receive(data)
  os.loadAPI("/rom/apis/colors") -- Loads the color API
  msg,size,col = data[1],data[2],mon.setTextColor(data[3])
  print("Message:\n")
  print(msg) -- Prints message in terminal
  print("Table: \n" .. textutils.serialize(data) ) -- temporary code | To see all data received
  print()
  monCl()
  screen()
end