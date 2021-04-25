Key = 51

vehicleWashStation = {
    {-279.3948059082,2842.8881835938,54.034488677978},
    {-276.43814086914,2841.9343261718,53.898742675782},
    {-293.94219970704,2840.5249023438,55.448642730712},
    {-292.01400756836,2839.4133300782,55.318466186524},
    {-289.95877075196,2838.2680664062,55.268375396728}
}
local ok = true
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsPedAPlayer(GetPlayerPed(-1)) then 
			for i = 1, #vehicleWashStation do 
				coords = vehicleWashStation[i]
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), coords[1], coords[2], coords[3], true ) < 1 then
					if ok == true then
					drawtext(0.94, 1.2 ,1.0,1.0,0.6,"Press [E] to search the grave.", 255,255,255,250, 1)
					if(IsControlJustPressed(1, 51)) then
						ok = false
						
					Citizen.Wait(100)
					local playerPed = PlayerPedId()
					TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)	
				Wait(1)	
					exports["np-taskbar"]:taskBar(6000,"Searching for body")	
						RequestModel( GetHashKey( "a_m_y_hasjew_01" ) )
						while ( not HasModelLoaded( GetHashKey( "a_m_y_hasjew_01" ) ) ) do
							Citizen.Wait( 1 )
						end
						local pos = GetEntityCoords(GetPlayerPed(-1))
						local ped = CreatePed(29, 0xE16D8F01, pos.x, pos.y, pos.z-1.6, 90.0, true, false)
						SetEntityHealth(ped, 0)
						local playerPed = PlayerPedId()
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)	
						exports["np-taskbar"]:taskBar(6000,"Finding")  	
						DeleteEntity(ped)
						Wait(1000)
						ClearPedTasks(playerPed)
						TriggerServerEvent('esx_grave:reward')
						
						ok = true
						end
					end
				end
			end
		end
	end
end)

function drawtext(x,y ,width,height,scale, text, r,g,b,a, font)
	SetTextFont(6)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end
