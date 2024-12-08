import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggle"]
  
  connect() {
    // Initialize the toggle state based on current theme
    this.updateToggleState()
  }

  toggle() {
    const isDark = document.documentElement.classList.toggle('dark')
    localStorage.setItem('theme', isDark ? 'dark' : 'light')
    this.updateToggleState()
  }

  updateToggleState() {
    const isDark = document.documentElement.classList.contains('dark')
    this.element.setAttribute('aria-pressed', isDark)
  }
}