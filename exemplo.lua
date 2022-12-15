local M2GG = require("menu2gg")

local menu1 = M2GG.createMenu()
local menu2 = M2GG.createMenu()

menu1:createOption("Ir para Menu 2", function()
  menu2:Show()
end)

menu1:createOption("Sair", function()
  os.exit()
end)

menu2:createOption("Voltar para Menu 1", function()
  menu1:Show()
end)

menu2:createOption("Sair", function()
  os.exit()
end)

menu1:Show()
