import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.boundHide = this.hide.bind(this)
  }

  disconnect() {
    document.removeEventListener("click", this.boundHide)
  }

  toggle(event) {
    event.stopPropagation()
    this.menuTarget.classList.toggle("hidden")
    if (!this.menuTarget.classList.contains("hidden")) {
      document.addEventListener("click", this.boundHide)
    } else {
      document.removeEventListener("click", this.boundHide)
    }
  }

  hide(event) {
    this.menuTarget.classList.add("hidden")
    document.removeEventListener("click", this.boundHide)
  }
}
