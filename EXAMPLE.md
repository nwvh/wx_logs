```lua
exports['wx_logs']:SendLog("death",{
    username = "Player Deaths",
    color = 16737095,
    title = "Death",
    fields = {
        {
            ["name"]= "Player Name",
            ["value"]= playerName,
            ["inline"] = true
        },
        {
            ["name"]= "Coords",
            ["value"]= coords,
            ["inline"] = true
        },
        {
            ["name"]= "Death Cause",
            ["value"]= reason,
            ["inline"] = true
        },
    },
})

```
