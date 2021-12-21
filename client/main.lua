local QBCore = exports["qb-core"]:GetCoreObject()

isLoggedIn = true

local onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	if PlayerData.job.onduty then
	    if PlayerData.job.name == "bestbuds" then
		TriggerServerEvent("QBCore:ToggleDuty")
	    end
	end
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    if PlayerData.job.name == 'bestbuds' then
    	onDuty = duty
    end
end)

Citizen.CreateThread(function()
    BurgerShot = AddBlipForCoord(377.07, -828.86, 29.3)
    SetBlipSprite (bestbuds, 106)
    SetBlipDisplay(bestbuds, 4)
    SetBlipScale  (bestbuds, 0.5)
    SetBlipAsShortRange(bestbuds, true)
    SetBlipColour(bestbuds, 75)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("bestbuds")
    EndTextCommandSetBlipName(bestbuds)
end) 

RegisterNetEvent("qb-buds:DutyBuds")
AddEventHandler("qb-buds:DutyBuds", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-buds:Tray1")
AddEventHandler("qb-buds:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "budstray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "budstray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-buds:Storage")
AddEventHandler("qb-buds:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "budsstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "budsstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)