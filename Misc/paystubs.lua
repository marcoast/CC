-- Paystubs (Tickets) --
local ticket = peripheral.wrap("left")
local drive = peripheral.wrap("right")
local sensor = peripheral.wrap("top")

local function getTimeAPI()
	if fs.exists("/time") == true then
	else
		shell.run("pastebin ","get ","TNLjCCKq ","time")
	end
end

local function giveTicket() -- Gets specific player data via sensor, and gives ticket
	if rs.getInput("front") ==  true then
		local pData = sensor.getPlayers()
	end
end

local function senseDisk() -- Senses whether disk is inserted
	-- Code here...
end

getTimeAPI()
os.loadAPI("/time")
giveTicket()
debug.log(pData)
time.printTime("cst",0,"",2)