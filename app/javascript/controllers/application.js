// app/javascript/application.js
import { Application } from "@hotwired/stimulus"
import { registerPrimer } from "@primer/view-components"

const application = Application.start()
registerPrimer(application)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// ViewComponents in app/views/components
import viewComponentControllers from "./../../views/components/**/controller.js"

viewComponentControllers.forEach((controller) => {
  const { name, module } = controller

  // Tidy up controller name
  // ..--..--views--components--video-reviewer--controller.js => video-reviewer
  const controllerName = name
    .replaceAll('..--..--views--components--', '')
    .replaceAll('--controller.js', '')

  application.register(controllerName, module.default)
})

export { application }
