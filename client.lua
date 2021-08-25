function MedinaaConvertLuaTextIntoHtml(text)
    text = text:gsub("~r~", "<span style=Color:red;>") 
    text = text:gsub("~b~", "<span style=Color:blue;>")
    text = text:gsub("~g~", "<span style=Color:green;>")
    text = text:gsub("~y~", "<span style=Color:yellow;>")
    text = text:gsub("~p~", "<span style=Color:purple;>")
    text = text:gsub("~c~", "<span style=Color:grey;>")
    text = text:gsub("~m~", "<span style=Color:darkgrey;>")
    text = text:gsub("~u~", "<span style=Color:black;>")
    text = text:gsub("~o~", "<span style=Color:gold;>")
    text = text:gsub("~s~", "</span>")
    text = text:gsub("~w~", "</span>")
    text = text:gsub("~b~", "<b>")
    text = text:gsub("~n~", "<br>")
    text = "<span>" .. text .. "</span>"

    return text
end

function MedinaaGetColor(text)
    if text:find("~r~") then
        text = 'red'
        return text
    elseif text:find("~b~") then
        text = 'blue'
        return text
    elseif text:find("~g~") then
        text = 'green'
        return text
    elseif text:find("~y~") then
        text = 'yellow'
        return text
    elseif text:find("~p~") then
        text = 'purple'
        return text
    elseif text:find("~c~") then
        text = 'grey'
        return text
    elseif text:find("~m~") then
        text = 'darkgrey'
        return text
    elseif text:find("~u~") then
        text = 'black'
        return text
    elseif text:find("~o~") then
        text = 'gold'
        return text
    elseif text:find("~s~") then
        text = 'white'
        return text
    elseif text:find("~w~") then
        text = 'white'
        return text
    end


    text = 'white'
    return text
end

Citizen.CreateThread(function ()
    while true do
        SendNUIMessage({
            mapaopen = IsRadarEnabled()
        })
        Citizen.Wait(1000)
    end
end)

function ShowNotification(message, timeout)
    SendNUIMessage({
        show = true,
        timeout = timeout or 3000,
        mapaopen = IsRadarEnabled(),
        message = MedinaaConvertLuaTextIntoHtml(message),
        color = MedinaaGetColor(message),
        id = math.random(1, 5000000),
        id2 = math.random(1, 50000000)
    })
end

RegisterNetEvent('mdn_notifications:showNotification')
AddEventHandler('mdn_notifications:showNotification', function(message, timeout)
    ShowNotification(message, timeout)
end)

RegisterNetEvent('mdn_notications:deleteNotis')
AddEventHandler('mdn_notications:deleteNotis', function()
    SendNUIMessage({
        delete = true,
    })
end)