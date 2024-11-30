# ox_target

![](https://img.shields.io/github/downloads/overextended/ox_target/total?logo=github)
![](https://img.shields.io/github/downloads/overextended/ox_target/latest/total?logo=github)
![](https://img.shields.io/github/contributors/overextended/ox_target?logo=github)
![](https://img.shields.io/github/v/release/overextended/ox_target?logo=github) 


A performant and flexible standalone "third-eye" targeting resource, with additional functionality for supported frameworks.

ox_target is the successor to qtarget, which was a mostly-compatible fork of bt-target.
To improve many design flaws, ox_target has been written from scratch and drops support for bt-target/qtarget standards, though partial compatibility is being implemented where possible.


```lua
exports.ox_target:SpawnPed({
    model = 'a_m_m_indian_01',
    coords = vector4(901.34, -170.06, 74.08, 228.81),
    minusOne = true,
    freeze = true,
    invincible = true,
    blockevents = true,
    animDict = 'abigail_mcs_1_concat-0',
    anim = 'csb_abigail_dual-0',
    flag = 1,
    scenario = 'WORLD_HUMAN_AA_COFFEE',
    target = {
        options = {
            {
                type = 'client',
                event = 'qb-taxijob:client:requestcab',
                icon = 'fas fa-sign-in-alt',
                label = '🚕 Request Taxi Cab',
                job = jobRequired,
            }
        },
        distance = 2.5,
    },
    spawnNow = true,
    currentpednumber = 0,
 })  
```

## 📚 Documentation

https://overextended.dev/ox_target

## 💾 Download

https://github.com/overextended/ox_target/releases/latest/download/ox_target.zip

## ✨ Features

- Improved entity and world collision than its predecessor.
- Improved error handling when running external code.
- Menus for nested target options.
- Partial compatibility for qtarget (the thing qb-target is based on, I made the original idiots).
- Registering options no longer overrides existing options.
- Groups and items checking for supported frameworks.
