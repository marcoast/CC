-- Paystubs (Tickets) --
local ticket = peripheral.wrap("left")
local drive = peripheral.wrap("right")
local sensor = peripheral.wrap("top")
local pData = sensor.getPlayers()
local fileWrite = fs.open("/paystubs/players","w")
local fileRead = fs.open("/paystubs/players","r")

local function checkTimeAPI()
	if fs.exists("/time") == true then
	else
		shell.run("pastebin ","get ","TNLjCCKq ","time")
	end
end

local function getData() -- Gets and saves the full player data from nearby players in a file.
	fileWrite.write( textutils.serialize(pData) )
	fileWrite.close()
	-- # Break down time into mm-dd-yyyy hh:mm AM/PM to store into file
end

local function loadData() -- Loads the whole file.
	fileRead.readAll()
	readData = textutils.serialize(1)
	print(readData)
	debug.log(readData)
end

local function giveTicket() -- Gets specific player data via sensor, and gives 2 copies of tickets
	write("Enter payment: ")
	payment = read()
	printTicket = ticket.createTicket( pData[1]["name"] .. " " .. time.getTime("cst",0,"",2) .. " $" .. payment,1 )  
	printTicket
	sleep(10)
	printTicket
end


checkTimeAPI()
os.loadAPI("/time")
if rs.getInput("front") == true then
	getData()
	giveTicket()
	-- debug.log(pData)
	time.printTime("cst",0,"",2)
else
	os.reboot()
end


save