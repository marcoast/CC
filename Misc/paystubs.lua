-- Paystubs (Tickets) --
-------------------------------------------------
local ticket = peripheral.wrap("left")
local drive = peripheral.wrap("right")
local sensor = peripheral.wrap("top")
-------------------------------------------------
local players = sensor.getPlayers()
local pData = sensor.getPlayerData(players[i].name)
local holdingID = pData.all().living.heldItem.id
-------------------------------------------------
local fileWrite = fs.open("/paystubs/players","a")
local fileRead = fs.open("/paystubs/players","r")
-------------------------------------------------
local stampNow = time.getTimeTable("cst",0,true)
local stampWeek = time.getTimeTable("cst",24*7,true)
-------------------------------------------------
local i = 1

local function checkTimeAPI()
	if fs.exists("/time") == true then
	else
		shell.run("pastebin ","get ","TNLjCCKq ","time")
	end
end

local function getData() -- Gets and saves the full player data from nearby players in a file.
	fileWrite.writeLine( {players = textutils.serialize(players); TstampNow = textutils.serialize(stampNow); TstampWeek = textutils.serialize(stampWeek)} )
	fileWrite.close()
	-- # Break down time into mm-dd-yyyy hh:mm AM/PM to store into file
end

local function loadData() -- Loads the whole file.
	readData = fileRead.readAll()
	fileRead.close()
	debug.log(readData) -- 
	return textutils.serialize(readData)
end

local function giveTicket() -- Gets specific player data via sensor, and gives 2 copies of tickets
	write("Enter payment: ")
	payment = read()
	-- if [time on ticket].preferredLocalDateTime > stampWeek.preferredLocalDateTime do
	for i = 1,#pData do 
		if pData == nil then 
			
end


checkTimeAPI()
os.loadAPI("/time")
while true do
	getData()
	loadData()
	giveTicket()
	-- debug.log(players) -- 
	time.printTime("cst",0,"",2)
else
	os.shutdown()
end
