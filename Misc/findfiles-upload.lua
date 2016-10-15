local docw = fs.open("/saved/helpdocs","w")
local docr = fs.open("/saved/helpdocs","r")
local finder = "data = " .. textutils.serialize( fs.find("*/help/*") )
local  
local pastes = fs.open("/saved/pastes","w")

function findSave()
	fs.makeDir("/saved")
	docw.WriteLine( finder )
	docw.close
end

function pasting()
	for i=1,10 do
		print("Result #" .. i)
		shell.run("pastebin","put", textutils.unserialize( data[i]) )
		os.sleep(20)
	end
end

term.clear
fs.delete("/saved")
findSave()