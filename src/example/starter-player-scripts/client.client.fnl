;;; Services
(local replicated-storage (game:GetService "ReplicatedStorage"))
(local players (game:GetService "Players"))
(local starter-player (game:GetService "StarterPlayer"))
(local starter-player-scripts (starter-player:WaitForChild "StarterPlayerScripts"))

;;; Libraries
(local libraries (replicated-storage:WaitForChild "libraries"))
(local simple-framework (require (libraries:WaitForChild "simple-framework")))

;;; Constants
(local player players.LocalPlayer)
(local character (or player.Character (player.CharacterAdded:Wait)))

(local systems (starter-player-scripts:WaitForChild "systems"))

;;; Local Functions
(fn main []
  (simple-framework.setup-systems (systems:GetChildren))
  (simple-framework.start))

;;; Return
(main)