term.clear()
term.setCursorPos(1,1)

os.loadAPI("/rom/apis/colors") -- Loads the color API

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
  local size = data[2]
  local color = data[3]
  mon.setTextScale(size)
  mon.setTextColor(color)
  local mon1 = term.redirect(mon)
  print(data[1])
  term.redirect(mon1)
end

while true do
  print("Waiting on message....\n")
  receive(data)
  print("Message:\n")
  print(data[1]) -- Prints message in terminal
  print(data[3]) -- Prints color in terminal
  print()
  monCl()
  screen()
end