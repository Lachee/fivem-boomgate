print("Loading Lachee's Boom Gate")

-- Configuration
Config = { }
Config.debug = false -- Debug visualisation
Config.radius = 5.0 -- How close the player must be to trigger the event
Config.gateCheckTime = 250 -- How often in milliseconds to check if we are near a gate
Config.gateCooldownTime = 1000 -- The delay before we try to any gate again
Config.gateReceiveRange = 100 -- How close must the player be to try and render this gate
Config.maxAngleDifference = 90 -- How straight must the vehicle be relative to the gate to trigger? Set to 360 for any

-- Global Variabels
Config.barriers = {
    'prop_sec_barrier_ld_02a', 
    'prop_sec_barrier_ld_01a',
    'prop_sec_barier_04b',       -- This looks jank but is required for airport
}
Config.rotLimit = -89