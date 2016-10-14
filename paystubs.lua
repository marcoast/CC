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

local function sensePlayer() -- Gets specific player data via sensor
	if rs.getInput("front") ==  true then
		local pData = sensor.getPlayerByName("DroMania")
		local tNum = math.random()
		print("\nTicket #:" .. tNum )
	end
end
local function senseDisk() -- Senses whether disk is inserted
	-- Code here...
end

getTimeAPI()
os.loadAPI("/time")
sensePlayer()
debug.log(pData)
time.printTime("cst",0,"",2)