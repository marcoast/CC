local wifi = peripheral.wrap("back")
local side = "bottom"
local far = 8
--------
local recv = 100

while true do 
	wifi.open(100)
	data = { os.pullEvent("modem_message") }
	msg = data[5]
	dist = tonumber(data[6])
	if ( dist < far  or msg == "open" ) then
		rs.setOutput(side,true)
		sleep(2)
	elseif dist > far
		rs.setOutput(side,false)
	end
end