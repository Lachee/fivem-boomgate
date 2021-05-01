
-- We recieved an open request
RegisterNetEvent('lacheeboom:openBoomGate')
AddEventHandler('lacheeboom:openBoomGate', function(coords) 
    local playerCoords = GetEntityCoords(PlayerPedId())
    if GetDistanceBetweenCoords(playerCoords, coords, true) <= Config.gateReceiveRange then
        OpenGate(coords)
    end
end)


-- Draw the debug visualisations
function OpenGate(coords) 
    local object = FindNearestObject(Config.barriers, 1.0, coords)    
    local rotation = GetEntityRotation(object, 0)

    if object ~= nil and rotation.y > Config.rotLimit then
        Citizen.CreateThread(function()
            -- Prepare some counts
            local millis = 0
            local delay = 16

            -- Animate the rotation
            while rotation.y > Config.rotLimit and object ~= nil  do
                Citizen.Wait(delay)
                millis = millis + delay

                if Config.debug then
                    DrawZoneMarkerGrounded(coords, 2.0, { r = 0, g = 255, b = 0 }) 
                end

                -- Update the rotation and set the object's rotation
                rotation = GetEntityRotation(object, 0)
                SetEntityRotation(object, rotation.x, rotation.y-0.95, rotation.z, 0, true)
            end
        end)
    end
end

-- Find gates
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(Config.gateCheckTime)

        local object = FindNearestObject(Config.barriers, Config.radius)
        if object then 

            local heading = GetEntityHeading(object)
            local playerHeading = GetEntityHeading(PlayerPedId())
            local headingDiff = (playerHeading - heading + 180 + 360) % 360 - 180
            if headingDiff > -Config.maxAngleDifference and headingDiff < onfig.maxAngleDifference then

                -- Trigger the sever callback
                TriggerServerEvent('lacheeboom:requestBoomGate', GetEntityCoords(object))
                
                if Config.debug then
                    -- Render that we are drawing it
                    DrawZoneMarkerGrounded(GetEntityCoords(object), 3.0, { r = 255, g = 0, b = 0 }) 
                end

                -- Wait some significant time before we try again
                Citizen.Wait(Config.gateCooldownTime)
            end
        end
    end
end)