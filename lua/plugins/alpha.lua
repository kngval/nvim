return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local devicons = require("nvim-web-devicons")
    local startify = require("alpha.themes.startify")
    local function get_icon(name, fallback)
      return devicons.get_icon(name) or fallback
    end
    dashboard.section.header.opts = {
      position = "center"
    }
    -- Initialize buttons section

    dashboard.section.quote = {
      type = "text",
      val = "“Don’t make a name for yourself as a Cyberpunk by how you live… Make a name by how you die.” - Lucy, Cyberpunk: Edgerunners",
      opts = {
        position = "center",
        hl = "String", -- You can set a custom highlight group for the quote
      },
    }
      dashboard.opts.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      dashboard.section.quote,  -- Place quote below buttons
    }
    dashboard.section.header.val = {
-- [[⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀]],
-- [[⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀]],
-- [[⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀]],
-- [[⠀⣿⣿⣿⣿⣿⣿⣿⣷⢿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀]],
-- [[⢀⣿⠘⣿⡿⣿⣿⣿⣿⡎⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀]],
-- [[⠈⣿⠀⢿⣿⢹⣻⣿⣯⣿⡄⢻⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡞⣿⣿⣿⡄]],
-- [[⠀⣿⡄⠘⣿⡇⢿⣿⡿⡜⢿⣀⣹⣯⠿⠟⠛⠋⠁⠉⠉⠉⠈⠀⢿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣧]],
-- [[⠀⢿⣇⠀⠹⠿⠌⠋⠋⠉⠉⠉⠁⠀⣀⣠⡤⠶⢶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⣿⣿⣿]],
-- [[⠀⠀⢻⡤⠖⣒⣢⣄⠀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠈⢿⠓⣻⡿⠋⠀⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⡟]],
-- [[⠀⠀⠀⢹⣌⣠⠶⣾⣷⡄⠀⠀⠀⠀⠀⠀⠀⢀⢀⣀⣽⠋⠀⠀⠀⢹⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⠿⠋⠀]],
-- [[⠀⠀⠀⢸⣿⣿⡄⠘⠭⡇⠀⠀⠀⠀⠀⠀⠀⠈⠻⠛⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣷⢿⣿⣿⣿⠟⠀⠀⠀]],
-- [[⠀⠀⠀⢸⣿⣿⡍⠳⢾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⠸⢛⠟⠁⠀⠀⠀⠀]],
-- [[⠀⠀⠀⢸⣿⣿⣇⢀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⢿⠔⠁⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠨⣿⣿⣿⡌⣷⣄⠠⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⣿⣿⣇⠹⡌⠉⠁⠀⠀⠀⠀⣀⡤⢤⣴⡶⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠋⣾⢹⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⣿⣿⣯⠀⠹⣄⠀⠀⠰⣯⣵⢟⣋⣽⡋⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⣿⠸⠟⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⢸⣿⣿⠀⠀⠙⢦⡀⠀⠈⠿⠿⠿⠛⠁⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⡿⠀⠉⠀⠀⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⢸⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠋⠀⣿⣿⣿⡇⠀⠀⣀⣠⣤⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⠀⣿⣿⡀⠀⠀⠀⢻⣿⣿⣄⠀⠀⠀⠀⠀⣀⣴⠛⠁⠀⠀⠀⣿⣿⣿⣷⣶⠿⠛⠋⠉⠘⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
-- [[⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠸⣿⣿⣿⣦⣀⣠⣴⡟⠋⢹⠀⠀⣀⣠⡴⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]]

[[======-=+######**======================::     ::+-:   . :    ..::                         ]],
[[======--*########+====+=========+========       #+=.    =      :=                      ]],   
[[======-=##########====+=========+========.      #*=:   :*      :+.                        ]],
[[======-*##########+====+=========+=======.      ##+-  :+#  ..  :+-                    .   ]],
[[======-*###########====*=========+=======.     .***=  **#::+++*+#=                    .  ]], 
[[=======############*===+*=========+=====+.    -:###+=+#*+==-:.  *+.                   .  ]], 
[[=======#############++==+*=========+====+: :-+###*=--.       :--++:   .               .   ]],
[[=====+=##############+*==+*=======****+***####-:   .:-=+*##%@@%==*-   .               .   ]],
[[=====++*###*********##*#***#*****###*++=*#+.+- :=#%@%%%##*. *#: -*=   .               .   ]],
[[=====+*###########**++++***==--::...  .##*.-#*%*=#*=+*+-.= .+.  .*=:  .              ..   ]],
[[=====+**#############=-+****-        .=#*. :.+    *=.  .-. .    .#=- ..              ..   ]],
[[======***###%%%%%%%%%%==-+###*-      =+-:    :     .:::..:       *=- ..              :.   ]],
[[=+====*****##%@%###%%%%%%%#####*.    -:       -: .:.::--.        *== :.              -.   ]],
[[=+====******###%#***#+---..- =+#+                 .:--:          *+=.-              .-.   ]],
[[=*====*******#####****+.....   +#:                               +==:-              :-.   ]],
[[=+==+**********###***=--::.  :*+-:                             :-==-:.            .::.    ]],
[[++==+++*********#####*+=-.  :*##--                             :-==-:.            .:..  ]],  
[[+===+++**********#####+=-: :+###=-.                            :-===:.            :::.  ..]],
[[=+===++***********#####*===+*###+=.                            ::+==:.            .:::...:]],
[[-=-==+++***********##############*.                             .#===:             --:: ::]],
[[---+==++*********+***##############+==*+.                       -*===.            .---:-=.]],
[[--======*******+=----+################-                         +*===.            :---:+=-]],
[[----+===******+--------+#############+       ...:..            -**===.           .----=---]],
[[----====+****+----------=*############+====++=--:.            :***===            :--+=----]],
[[----====+**+=-------------=*##########*=----::.              .**#+==-           .---#%=---]],



      -- [[ ________      ___    ___ ________  _______   ________  ________  ___  ___  ________   ___  __ ]],
      -- [[|\   ____\    |\  \  /  /|\   __  \|\  ___ \ |\   __  \|\   __  \|\  \|\  \|\   ___  \|\  \|\  \ ]],
      -- [[\ \  \___|    \ \  \/  / | \  \|\ /\ \   __/|\ \  \|\  \ \  \|\  \ \  \\\  \ \  \\ \  \ \  \/  /|_ ]],
      -- [[ \ \  \        \ \    / / \ \   __  \ \  \_|/_\ \   _  _\ \   ____\ \  \\\  \ \  \\ \  \ \   ___  \ ]],
      -- [[  \ \  \____    \/  /  /   \ \  \|\  \ \  \_|\ \ \  \\  \\ \  \___|\ \  \\\  \ \  \\ \  \ \  \\ \  \ ]],
      -- [[  \ \_______\__/  / /      \ \_______\ \_______\ \__\\ _\\ \__\    \ \_______\ \__\\ \__\ \__\\ \__\]],
      -- [[    \|_______|\___/ /        \|_______|\|_______|\|__|\|__|\|__|     \|_______|\|__| \|__|\|__| \|__|]],
      -- [[             \|___|/                                                                                 ]]

      -- [[      ___           ___           ___           ___           ___           ___           ___           ___           ___    ]],
      -- [[     /\  \         |\__\         /\  \         /\  \         /\  \         /\  \         /\__\         /\__\         /\__\    ]],
      -- [[   /::\  \        |:|  |       /::\  \       /::\  \       /::\  \       /::\  \       /:/  /        /::|  |       /:/  /    ]],
      -- [[   /:/\:\  \       |:|  |      /:/\:\  \     /:/\:\  \     /:/\:\  \     /:/\:\  \     /:/  /        /:|:|  |      /:/__/     ]],
      -- [[  /:/  \:\  \      |:|__|__   /::\~\:\__\   /::\~\:\  \   /::\~\:\  \   /::\~\:\  \   /:/  /  ___   /:/|:|  |__   /::\__\____ ]],
      -- [[ /:/__/ \:\__\     /::::\__\ /:/\:\ \:|__| /:/\:\ \:\__\ /:/\:\ \:\__\ /:/\:\ \:\__\ /:/__/  /\__\ /:/ |:| /\__\ /:/\:::::\__\]],
      -- [[ \:\  \  \/__/    /:/~~/~    \:\~\:\/:/  / \:\~\:\ \/__/ \/_|::\/:/  / \/__\:\/:/  / \:\  \ /:/  / \/__|:|/:/  / \/_|:|~~|~   ]],
      -- [[  \:\  \         /:/  /       \:\ \::/  /   \:\ \:\__\      |:|::/  /       \::/  /   \:\  /:/  /      |:/:/  /     |:|  |    ]],
      -- [[   \:\  \        \/__/         \:\/:/  /     \:\ \/__/      |:|\/__/         \/__/     \:\/:/  /       |::/  /      |:|  |    ]],
      -- [[    \:\__\                      \::/__/       \:\__\        |:|  |                      \::/  /        /:/  /       |:|  |    ]],
      -- [[     \/__/                       ~~            \/__/         \|__|                       \/__/         \/__/         \|__|    ]]


    }
    -- Center the header section

    alpha.setup(dashboard.opts)
  end,
}
