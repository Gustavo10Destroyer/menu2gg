local menu2gg = {}

function menu2gg.Menu(Title)
  local Menu = {}
  Menu.Title = Title
  Menu.Options = {}
  
  function Menu:Show()
    if gg.isVisible() then
      local _Options = {}
      
      for _, Option in pairs(self.Options) do
        table.insert(_Options, Option.Text)
      end
      
      local choice = gg.choice(_Options, nil, self.Title)
    
      if choice then
        self.Options[choice].Callback()
      else
        gg.setVisible(false)
        
        while not gg.isVisible() do
          gg.sleep(1)
        end
        
        self:Show()
      end
    end
  end
  
  function Menu:AddOption(Option)
    local Id = #self.Options + 1
    
    table.insert(self.Options, Option)
    
    function Option.Delete()
      Option.Delete = nil
      
      table.remove(self.Options, Id)
    end
  end
  
  return Menu
end

function menu2gg.Option(Text, Callback)
  local Option = {}
  Option.Text = Text
  Option.Callback = Callback
  
  return Option
end

return menu2gg