;;; Simple Framework
;;; Developed by Lets Learn Lua
;;; Version 1

;;; API
;;; get-system()
;;; setup-systems()
;;; start()
;;; 
;;; on-setup()
;;; on-start()
;;; on-update(delta-time)

;;; Root
(local root {})

;;; Services
(local run-service (game:GetService "RunService"))

;;; Constants
(local systems {})

;;; Exported Functions
(fn root.get-system [name]
  (if (. systems name)
      (. systems name)
      (warn (.. "System with name " name " not found!"))))

(fn root.setup-systems [directory]
  (each [_ child (ipairs (directory:GetChildren))]
    (when (child:IsA "ModuleScript")
      (let [system (require child)]
        (when system.on-setup
          (system.on-setup))
        (tset systems child.Name system)))))

(fn root.start []
  (each [_ system (ipairs systems)]
    (when system.on-start
      ((coroutine.wrap system.on-start)))
    (when system.on-update
      (run-service.RenderStepped:Connect system.on-update))))

;;; Return
root