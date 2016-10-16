-- Wraps the peripherals currently in the 
scan = peripheral.getNames()
for i=1,#scan do
	scan.i = scan[i]
	
