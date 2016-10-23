local wifi = peripheral.wrap("back")
local send = 100
local recv = 200
--------------------

while true do 
	wifi.open(send,recv)
	wifi.transmit(send,recv,"auto")
	sleep(0.5)
end