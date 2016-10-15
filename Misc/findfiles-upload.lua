local docw = fs.open("/find/helpdocs","w") -- Opens a file named helpdocs in write mode
local docr = fs.open("/find/helpdocs","r") -- Opens a file named helpdocs in read mode
local finder = "data = " .. textutils.serialize( fs.find("*/help/*") ) -- To write a table of results to a file
local pastes = fs.open("/find/pastes","w") -- Opens a file named pastes in write mode, to save the resulting URL and name of file uploaded

function findSave() -- Find search term and save results to the helpdocs file
	fs.makeDir("/find/")
	docw.WriteLine( finder )
	docw.close()
end

function pasting() -- Uploads resulting program list to pastebin
	for i=1,10 do
		print("Result #" .. i)
		docr.readAll()
		shell.run("pastebin","put", textutils.unserialize(data[i]) )
		os.sleep(20) -- To avoid spam filter
	end
end

term.clear
fs.delete("/find/helpdocs")
findSave()
pasting()
docr.close()