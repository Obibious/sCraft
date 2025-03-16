local ESX = exports['es_extended']:getSharedObject()
local display = false
local timetoWait = 750

RegisterNetEvent('sCraft:updateInventory', function(inventory)
   ESX.TriggerServerCallback('sCraft:getPlayerInventory', function(inventory)
      SendNUIMessage({
         type = 'updateInventory',
         inventory = json.encode(inventory),
      })
   end)
end)


function SendCraftData(items, categories, title)
   ESX.TriggerServerCallback('sCraft:getPlayerInventory', function(inventory)
      SendNUIMessage({
         type = 'personalCraft',
         inventory = json.encode(inventory),
         categories = json.encode(categories),
         craftItems = json.encode(items),
         title = title
      }) 
   end)
   
end

function SetDisplay(bool, view)
   display = bool
   if (not view) then
      SendNUIMessage({
         type = 'toggleShow',
         
      })
   else
      SendNUIMessage({
         type = 'toggleShow',
         payload = { view }
      })
   end
   SetNuiFocus(bool, bool)
end

RegisterNUICallback('exitMenu', function()
   SetDisplay(false)
end)

RegisterNUICallback('craft', function(data)
   if data.canCraft then
      PlayCraftingAnimation(data.item.animDict, data.item.anim, data.timeToCraft, 1 , data.item, data.quantity)
   end
end)

RegisterCommand("+openCraftPersonal", function()
   SendCraftData(PersonalCraftItems, PersonalCategories, personalCraftTitle)
   SetDisplay(true, "craft")
end)

RegisterKeyMapping("+openCraftPersonal", "Ouvrir le menu de craft", "keyboard", "I")



function PlayCraftingAnimation(animDict, animName, duration, flag, item, quantity)
   local ped = PlayerPedId() 
   RequestAnimDict(animDict) 

   while not HasAnimDictLoaded(animDict) do
       Citizen.Wait(10)
   end
   SetDisplay(false)
   FreezeEntityPosition(ped, true)
   TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, duration * 1000, flag, 0, true, true, true)
   Citizen.Wait(duration * 1000)
   ClearPedTasksImmediately(ped)
   FreezeEntityPosition(ped, false)
   TriggerServerEvent('sCraft:craft', item, quantity)
end



Citizen.CreateThread(function()

   while true do
       local time = 1500
       for _,v in pairs(JobsCraftItems) do
      
           local dist = Vdist(GetEntityCoords(PlayerPedId(), false), v.pos.x, v.pos.y, v.pos.z) 
           if (dist <= 2 and (ESX.PlayerData.job.name == _  or _ == 'ALL' and dist <= 2)) then  
               time = 1 
               ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour accéder au craft')
               DrawMarker(27, v.pos.x, v.pos.y, v.pos.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)   
               if IsControlJustPressed(1,51) then
                openJobCraft(v.items, v.categories, v.title)
             end

             else
               time = 1500
         end
     end
     Wait(time)
   end
 end)

 function openJobCraft(items, categories, title)
   SendCraftData(items, categories, title)
   SetDisplay(true, "craft")
 end