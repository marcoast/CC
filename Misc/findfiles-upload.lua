local docs = fs.open("/saved/helpdocs","w")
local find = "data = " .. textutils.serialize( fs.find("*/help/*") )
local pastes = fs.open("/saved/pastes","w")


docs.writeLine(find)
docs.close()
for i=1,10 do
	print("Result #" .. i)
	shell.run("pastebin","put",data[i])

	os.sleep(20)
end
