;;; Services
(local server-script-service (game:GetService "ServerScriptService"))
(local replicated-storage (game:GetService "ReplicatedStorage"))

;;; Libraries
(local libraries (replicated-storage:WaitForChild "libraries"))
(local simple-framework (require (libraries:WaitForChild "simple-framework")))

;;; Constants
(local systems (server-script-service:WaitForChild "systems"))

;;; Local Functions
(fn main []
  (simple-framework.setup-systems (systems:GetChildren))
  (simple-framework.start))

;;; Return
(main)