import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mobileMenu"]
  
  connect() {
    this.mobileMenuTarget.classList.add("hidden")
  }

  toggle() {
    this.mobileMenuTarget.classList.toggle("hidden") 
  }
}