local M2GG = require("menu2gg")

local menu1 = M2GG.Menu()
local menu2 = M2GG.Menu()

local choice1 = M2GG.Option("Ir para Menu 2", function()
  menu2:Show()
end)

local choice2 = M2GG.Option("Sair", function()
  os.exit()
end)

local choice3 = M2GG.Option("Voltar para Menu 1", function()
  menu1:Show()
end)

local choice4 = M2GG.Option("Sair", function()
  os.exit()
end)

menu1:AddOption(choice1)
menu1:AddOption(choice2)
menu2:AddOption(choice3)
menu2:AddOption(choice4)

menu1:Show()