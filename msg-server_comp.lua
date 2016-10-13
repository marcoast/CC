term.clear()
term.setCursorPos(1,1)

local modem = peripheral.wrap("top")
modem.open(281,713,832)

local function sending()  -- Sends data table to client computer
while true do
  write("Enter message: ")
  msg = read()
  write("Enter text size, min. 0.5, incr. 0.5: ") -- # Needs to loop back here if incr. is not 0.5
  size = tonumber(read())
    if size == "" then
      size = 1
    end
  write("Enter text color: ")
  col = read()
    if col == "" then
      col = "white"
    end
  write("Enter background color: ")
  bgcol = read()
    if bgcol == "" then
      bgcol = "black"
    end
  modem.transmit(281,713,{msg,size,col,bgcol})  -- Data transfer.
  print("Sent '"..msg.."'")
  sleep(1)
  end
end

local function receiving() -- Receives, prints, and opens a new modem channel based on the computer id.
while true do
  event,modemSide,senderChannel,replyChannel,message,senderDistance = os.pullEvent("modem_message")
  print("Message received from computer #"..message)
  modem.open(message)
  end 
end

parallel.waitForAll(sending,receiving)
