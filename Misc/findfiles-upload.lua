local docs = fs.open("/saved/helpdocs","w")
local find = "data = " .. textutils.serialize( fs.find("*/help/*") )

docs.writeLine(find)
docs.close()