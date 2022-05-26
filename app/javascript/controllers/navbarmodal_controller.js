import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["menu"]


  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  modal() {
     if (this.menuTarget.classList.contains("d-flex")) {
      this.menuTarget.classList.remove("d-flex")
    } else {
      this.menuTarget.classList.add("d-flex")
    }
  }
}
