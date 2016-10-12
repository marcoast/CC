term.clear()
term.setCursorPos(1,1)

modem = peripheral.wrap("top") -- Wrap top modem.
modem.open(281,713,832) 
mon = peripheral.wrap("back") -- Wrap monitor behind the computer.

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
  mon.setTextScale(size)
  local mon1 = term.redirect(mon)
  print(data[1])
  term.redirect(mon1)
end

while true do
  print("Waiting on message....\n")
  receive(data)
  print("Message:\n")
  print(data[1])
  print()
  monCl()
  screen()
end