;;; System
(local system {})

;;; Services
(local replicated-storage (game:GetService "ReplicatedStorage"))

;;; Libraries
(local libraries (replicated-storage:WaitForChild "libraries"))
(local simple-framework (require (libraries:WaitForChild "simple-framework")))

;;; Exported Functions
(fn system.on-setup []
  (print "This runs when the system is setup!"))

(fn system.on-start []
  (print "This runs when the system is started!")
  (print "The code below will get another system by name, if it exists")
  (simple-framework.get-system "system-name"))

(fn system.on-update [delta-time]
  (print "Lastly, this runs every frame. It also passes delta time."))

;;; Return
system