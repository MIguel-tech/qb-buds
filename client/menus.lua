-- Target

Citizen.CreateThread(function()
	exports['berkie-target']:AddBoxZone("budsDuty", vector3(375.7, -824.91, 29.27), 1, 1.2, {
		name = "uwuDuty",
		heading = 91,
		debugpoly = true,
		minZ=28.0,
		maxZ=29.6,
	}, {
		options = {
		    {  
			event = "qb-uwu:DutyBuds",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "uwu",
		    },
		},
		distance = 1.5
	})
end)