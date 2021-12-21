-- Target

Citizen.CreateThread(function()

	exports['berkie-target']:AddBoxZone("budsDuty", vector3(375.65, -824.95, 29.3), 0.30, 1.2, {
		name = "budsDuty",
		heading = 177.88,
		debugPoly = true,
		minZ=29.6,
		maxZ=30.5,
	}, {
		options = {
			{
			event = "qb-buds:DutyBuds",
			icon = "fas fa-clipboard",
			label = "Clock In/Out",
			},
		},
		distance = 2.5
	})

	exports['berkie-target']:AddBoxZone("budstray1", vector3(377.26, -827.3, 29.3), 0.60, 0.70, {
		name = "budstray1",
		heading = 177.88,
		debugPoly = true,
		minZ=29.3,
		maxZ=29.8,
	}, {
		options = {
			{
			event = "qb-buds:Tray1",
			icon = "fas fa-clipboard",
			label = "Tray 1",
			},
		},
		distance = 1.5
	})
	
	exports['berkie-target']:AddBoxZone("budsRegister", vector3(380.2, -827.29, 29.3), 0.60, 0.70, {
		name = "budsRegister",
		heading = 177.88,
		debugPoly = true,
		minZ=29.3,
		maxZ=29.8,
	}, {
		options = {
			{
			event = "qb-buds:bill",
			params = 1,
			icon = "fas fa-credit-card",
			label = "Charge Customer",
			job = "bestbuds",
			},
		},
		distance = 2.0
	})

	exports['berkie-target']:AddBoxZone("budsShop", vector3(373.61, -827.76, 29.3), 2.10, 0.85, {
		name = "budsShop",
		heading = 177.88,
		debugPoly = true,
		minZ=28.3,
		maxZ=29.8,
	}, {
		options = {
			{
			event = "nh-context:OrderMenuBuds",
			icon = "fas fa-laptop",
			label = "Select Items.",
			job = "bestbuds",
			},
		},
		distance = 2.0
	})

	exports['berkie-target']:AddBoxZone("budsStorage", vector3(376.88, -824.5, 28.3), 0.9, 0.75, {
		name = "budsStorage",
		heading = 177.88,
		debugPoly = true,
		minZ=28.3,
		maxZ=29.8,
	}, {
		options = {
			{
			event = "qb-buds:Storage",
			icon = "fas fa-box",
			label = "Company Storage.",
			job = "bestbuds",
			},
		},
		distance = 2.0
	})

	exports['berkie-target']:AddBoxZone("budsWeedCrafting", vector3(382.51, -817.44, 29.3), 1.25, 2.25, {
		name = "budsWeedCrafting",
		heading = 179.88,
		debugPoly = true,
		minZ=28.3,
		maxZ=29.5,
	}, {
		options = {
			{
			event = "nh-context:budsWeedCrafting",
			icon = "fas fa-rocket",
			label = "Weed Crafting",
			job = "bestbuds",
			},
		},
		distance = 2.0
	})
	
end)

RegisterNetEvent('nh-context:OrderMenuBuds', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Shop Items |",
            txt = "",
        },
        {
            id = 1,
            header = "• Order Items",
            txt = "Order Items!",
            params = {
                event = "qb-buds:shop"
            }
        },
        {
            id = 2,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)

RegisterNetEvent('nh-context:budsWeedCrafting', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Start Rolling Some Weed |",
            txt = "",
        },
        {
            id = 1,
            header = "• AK 47 Strain Joint",
            txt = "Rolling Paper, AK 47 Baggy",
            params = {
                event = "qb-buds:ak47"
            }
        },
        {
            id = 2,
            header = "• Purple Haze Strain Joint",
            txt = "Rolling Paper, Purple Haze Baggy",
            params = {
                event = "qb-buds:bph"
            }
        },
        {
            id = 3,
            header = "• OG Kush Strain Joint",
            txt = "Rolling Paper, OG Kush Baggy",
            params = {
                event = "qb-buds:ogk"
            }
        },
        {
            id = 4,
            header = "• White Widow Strain Joint",
            txt = "Rolling Paper, White Widow Baggy",
            params = {
                event = "qb-buds:ww"
            }
        },
        {
            id = 5,
            header = "Nevermind (ESC)",
            txt = "",
        },
    })
end)

-- Billing --
RegisterNetEvent("qb-buds:bill")
AddEventHandler("qb-buds:bill", function()
    local bill = exports["nh-keyboard"]:KeyboardInput({
        header = "Create Receipt",
        rows = {
            {
                id = 0,
                txt = "Server ID"
            },
            {
                id = 1,
                txt = "Amount"
            }
        }
    })
    if bill ~= nil then
        if bill[1].input == nil or bill[2].input == nil then 
            return 
        end
        TriggerServerEvent("qb-buds:bill:player", bill[1].input, bill[2].input)
    end
end)