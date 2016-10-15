local docs = fs.open("/saved/helpdocs","w")
local docr = fs.open("/saved/helpdocs","r")
local find = "data = " .. fs.find("*/help/*")
local pastes = fs.open("/saved/pastes","w")

docs.writeLine(find)
docs.close()
docr.readAll()
for i=1,10 do
	print("Result #" .. i)
	shell.run("pastebin","put",data[i])
	local code = ( ... )
	print("Debug 'code': " .. code)
	os.sleep(20)
end
