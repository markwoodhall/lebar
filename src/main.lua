fennel = require("fennel")

debug.traceback = fennel.traceback
table.insert(package.loaders, function(filename)
   if love.filesystem.getInfo(filename) and 
       filename ~= 'cpu.fnl' and 
       filename ~= 'disk.fnl' and 
       filename ~= 'time.fnl' and 
       filename ~= 'xwindow.fnl' and 
       filename ~= 'pacman.fnl' and 
       filename ~= 'i3.fnl' and 
       filename ~= 'power.fnl' and 
       filename ~= 'memory.fnl' and
       filename ~= 'user.fnl' then
      return function(...)
         return fennel.eval(love.filesystem.read(filename), {env=_G, filename=filename}, ...), filename
      end
   end
end)

-- jump into Fennel
require("main.fnl")
