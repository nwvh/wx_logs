local availableWebhooks = {}

for webhook, data in pairs(wx.Webhooks) do
    if webhook then
        table.insert(availableWebhooks,webhook)
        if data.URL == '' or data.URL == 'webhook' or data.URL == nil then
            print("^7[^6WX LOGS^7] ^7[^3WARNING^7] Webhook type ^3"..webhook.."^7 doesn't have a webhook link set!")
        end
    else
        print("^7[^6WX LOGS^7] ^7[^1ERROR^7] No webhooks found!")
        return
    end
end

function SendLog(webhook,data)
    if wx.Webhooks[webhook] == nil then
        print("^7[^6WX LOGS^7] ^7[^1ERROR^7] Invalid webhook - [^3"..webhook.."^7]. Available webhooks: \n"..json.encode(availableWebhooks))
        return
    end
    if not data then
        print("^7[^6WX LOGS^7] ^7[^1ERROR^7] No data has been parsed!")
        return
    end
    if data.username == nil then data.username = "WX Logs" end

    local embed = {
        {
            ["author"] = data.author,
            ["color"] = data.color,
            ["title"] = data.title,
            ["url"] = data.url,
            ["description"] = data.description,
            ["fields"] = data.fields,
            ["footer"] = {
                ["text"] = "🌠 WX Logs - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
                ["icon_url"] = data.icon
            },
            ["thumbnail"] = data.thumbnail,
            ["image"] = data.image,
        }
    }
    PerformHttpRequest(wx.Webhooks[webhook].URL, function(err, text, headers) end, "POST",json.encode({username = wx.Webhooks[webhook].Username,embeds = embed,avatar_url = wx.Webhooks[webhook].Icon}),{["Content-Type"] = "application/json"})
end

exports('SendLog',function (webhook,data)
    SendLog(webhook,data)
end)

-- exports['wx_logs']:SendLog('test',{
--     title = "Hello!",
--     description = "This is a simple log system!",
-- })

AddEventHandler('onResourceStart',function (r)
    if r == GetCurrentResourceName() then
        if GetCurrentResourceName() ~= 'wx_logs' then
            print("^7[^6WX LOGS^7] ^7[^3WARNING^7] You have renamed the resource, make sure you also rename the exports!")
        end
    end
end)