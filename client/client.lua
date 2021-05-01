-- Draw the debug visualisations
Citizen.CreateThread(function()
    while true do

        local closestObject = FindNearestObject(Config.barriers, Config.radius)
        if closestObject then 

            if Config.debug then
                coords = GetEntityCoords(closestObject)
                DrawZoneMarkerGrounded(coords, 2.0, { r = 255, g = 0, b = 255 }) 
            end

            local rot = GetEntityRotation(closestObject, 0)
            SetEntityRotation(closestObject, rot.x, rot.y-0.95, rot.z, 0, true)
            Citizen.Wait(10)
        else
            Citizen.Wait(1000)
        end
    end
end)