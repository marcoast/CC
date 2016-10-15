local docs = fs.open("/saved/helpdocs","w")
local docr = fs.open("/saved/helpdocs","r")
local finder = fs.find("*/help/*")
local pastes = fs.open("/saved/pastes","w")

docs.writeLine( textutils.serialize(finder) )
docs.close()
local data = docr
for i=1,10 do
	print("Result #" .. i)
	shell.run("pastebin","put",finder[i])
	os.sleep(20)
end
