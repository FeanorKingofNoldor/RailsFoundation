// app/views/components/dropdown/controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
 static targets = ["menu"]

 connect() {
   console.log("Dropdown controller connected", this.element)
 }

 toggle(e) {
   console.log("Toggle clicked", e.target)
   this.menuTarget.classList.toggle("hidden")
 }
}