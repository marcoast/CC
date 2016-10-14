local m = peripheral.wrap("top")
if term.current then m.restoreTo = term.current() end
m.clear()

term.redirect(m)

m.setCursorPos(25,1)
m.setTextScale(1)
m.setTextColor(colors.red)
print("Welcome to BossLand!")
m.setCursorPos(1,3)
m.setTextColor(colors.green)
print("FREE POWER IS AVAILABLE!")

m.setCursorPos(1,5)
m.setTextColor(colors.orange)
print("** ANNOUNCEMENT **")
m.setTextColor(colors.gray)
print("We will soon allow up to 9 consecutive plots to be claimed, allowing for more insanity!")
m.setTextColor(colors.white)
print("\n- $75 per plot to claim, and $75 per plot every 24 hours for plot tax. There is currently no resident tax, and don't plan on having one.")
print("- You can claim up to 4 consecutive plots at this point, with a minimum of 2. If you need more plots, let us know. If you need to claim an outpost somewhere, let us know.")
print("- No need to deposit money into the town because it automatically takes it from your /bal.")
print("- Keep an eye on your /bal and /towny time. Make money by using /vote and selling items on /market.")
print("\n- As far as building goes, please no huge towers in the sky. However, you are free to dig to build to bedrock.")
print("- There MUST be a 1 block border within the edge of your claim to allow for a walking path. But you are free to build underneath the path.")
print("- Please keep all functional blocks and items within your house, or underground, once it's built. I'd like to keep the community looking nice! Farms, of course, are allowed outside.")

m.setTextColor(colors.red)
print("\n- PLEASE keep all mining activities away from the town area.")
print("- Use /warp miningworld to go to the Mining World, duh. :D")

if term.current then
term.redirect(m.restoreTo)
else
term.restore()
end