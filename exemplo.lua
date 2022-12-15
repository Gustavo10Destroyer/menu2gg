local M2GG = require("menu2gg")

local menu = M2GG.createMenu()

menu:createOption("Opção #1", function()
    gg.toast("Você selecionou a opção #1!")
end)

menu:createOption("Desabilitar a 'Opção #1'", function()
    local targetOption = options:getMenu().options[1]
    local isEnabled = targetOption:isEnabled()

    if isEnabled then
      targetOption:disable()
      self:edit("Habilitar a 'Opção #1'")
    else
      targetOption:enable()
      self:edit("Desabilitar a 'Opção #1'")
    end
end)

menu:createOption("Sair", function()
  os.exit()
end)

menu:show()
