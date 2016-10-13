term.clear()
term.setCursorPos(1,1)

local modem = peripheral.wrap("back")
modem.open(281,713,832)

local function sending()  -- Sends data table to client computer
while true do
	write("Enter message: ")
	local msg = read()
	write("Enter text size (min. 0.5, incr. 0.5): ") -- # Needs to loop back here from error if incr. is not 0.5
	-- # rSize = input string | size = number sent in table
	local rSize = read() 
		if rSize == "" then
			size = 1
		else
			size = tonumber(rSize)
		end
	-------------------------------------------------------	
	write("Enter text color: ")
	local col = read()
		if col == "" then
			col = "white"
		else
		end
	write("Enter background color: ")
	local bgcol = read()
		if bgcol == "" then
			bgcol = "black"
		else
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

parallel.waitForAll(receiving,sending)
