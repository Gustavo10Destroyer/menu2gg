local menu2gg = {}

function menu2gg.createMenu(title)
  local menu = {}
  menu.title = title
  menu.options = {}

  function menu:show()
    if gg.isVisible() then
      local _options = {}

      for _, option in pairs(self.options) do
        table.insert(_options, option.text)
      end

      local choice = gg.choice(_options, nil, self.title)

      if choice then
        self.options[choice].handler()
      else
        gg.setVisible(false)

        while not gg.isVisible() do
          gg.sleep(1)
        end

        self:show()
      end
    end
  end

  function menu:createOption(text, handler)
    local option = {}
    option.text = text
    option.handler = handler
    option.index = #self.options + 1

    table.insert(self.options, option)

    function option:Delete()
      self.Delete = nil

      table.remove(menu.options, self.index)
    end

    return option
  end

  return menu
end

return menu2gg
