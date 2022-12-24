local DisableControls = false

ESX = nil

Citizen.CreateThread(function()
	while not ESX do

		TriggerEvent("esx:getSharedObject", function(library) 
			ESX = library 
		end)

		Citizen.Wait(0)
	end

	if not DoesEntityExist(ped) then
		SpawnPed()
	end

	while true do
		local sleepThread = 1000

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local dst = GetDistanceBetweenCoords(coords, Config["ped"], true)

	end

end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
	ESX.PlayerData = playerData
end)

SpawnPed = function() 
	RequestModel(Config["ped"]["hash"])
  
	while not HasModelLoaded(Config["ped"]["hash"]) do
		Wait(1)
	end
	ped = CreatePed(5, Config["ped"]["hash"], Config["ped"]["pos"] - vector3(0.0, 0.0, 0.98), Config["ped"]["heading"], false, false)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_AA_SMOKE')
	SetPedDefaultComponentVariation(ped)
end
