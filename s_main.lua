local ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('sCraft:getPlayerInventory', function(source, cb)
   local xPlayer = ESX.GetPlayerFromId(source)
   local inventory = xPlayer.getInventory()
   cb(inventory)
end)

--@class item
--@field label string
--@field name string
--@field quantity number
--@field itemsNeeded table<string, number>
--@field timeToCraft number
--@field category string

RegisterNetEvent('sCraft:craft', function(item, quantity)
   local xPlayer = ESX.GetPlayerFromId(source)

    for k, v in pairs(item.itemsNeeded) do
        if xPlayer.getInventoryItem(v.name).count < v.quantity * quantity then
            TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez pas assez de ' .. v.label)
            return
        elseif xPlayer.getInventoryItem(v.name).count >= v.quantity * quantity then
            xPlayer.removeInventoryItem(v.name, v.quantity * quantity)
        end
    end
    if item.type == 'item' then
        xPlayer.addInventoryItem(item.name, quantity)
    elseif item.type == 'weapon' then
        xPlayer.addWeapon(item.name, item.ammo)
    end
    TriggerClientEvent('esx:showNotification', source, 'Vous avez crafté ' .. quantity .. ' ' .. item.label)
    TriggerClientEvent('sCraft:updateInventory', source)
end)