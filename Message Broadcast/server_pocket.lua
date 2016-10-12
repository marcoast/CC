term.clear()
term.setCursorPos(1,1)

modem = peripheral.wrap("back")
modem.open(281,713,832)

function sending()
while true do
  write("Enter message: ")
  msg = read()
  write("Enter text size, min. 0.5, incr. 0.5: ")
  size = tonumber(read())
  modem.transmit(281,713,{msg,size})
  print("Sent '"..msg.."'")
  sleep(2)
  end
end

function feedback()
while true do
  local event,modemSide,senderChannel,replyChannel,message,senderDistance = os.pullEvent("modem_message")
  print("Message received on channel #"..senderChannel)
 end 
end

parallel.waitForAny(sending,feedback)