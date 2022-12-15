local menu2gg = {}

function menu2gg.createMenu(title)
  local menu = {}
  menu.title = title
  menu.options = {}

  function menu:show()
    if gg.isVisible() then
      local _options = {}

      for _, option in pairs(self.options) do
        if not option.removed and option:isEnabled() then
          table.insert(_options, option.text)
        end
      end

      local choice = gg.choice(_options, nil, self.title)

      if choice then
        self.options[choice]:handler()
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
    option.enabled = true
    option.removed = false
    option.handler = handler
    option.index = #self.options + 1

    table.insert(self.options, option)

    function option:edit(newText, newHandler)
      self.text = type(newText) == "string" and newText or self.text
      self.handler = type(newHandler) == "function" and newHandler or self.handler
    end

    function option:remove()
      if self.removed then return end
      self.removed = true

      table.remove(menu.options, self.index)
    end

    function option:enable()
      self.enabled = true
    end

    function option:disable()
      self.enabled = false
    end

    function option:isEnabled()
      return self.enabled
    end
    
    function option:getMenu()
      return menu
    end

    return option
  end

  return menu
end

return menu2gg
