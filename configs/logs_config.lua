wx = {} -- Don't touch

wx.Webhooks = { -- Main config section
    ['deaths'] --[[ Webhook Name/ID that will be used in the export ]] = {
        Username = "Player Deaths", -- Webhook username
        Icon = '', -- Image URL that will be used in footer and profile picture
        URL = '', -- Webhook URL
    },
    ['test']= {
        Username = "Test Webhook",
        Icon = '',
        URL = '',
    },
    -- ['Add more webhooks here!']= {
    --     Username = "You can add how many webhooks you want!",
    --     Icon = '',
    --     URL = '',
    -- },

}