import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller", this.element)
  }

  favorited() {
    // this.element.setAttribute("color", "red");
    console.log(this.element);
    this.element.style.color = "red"
    console.log(this.element);
  }

  reset() {
    // this.element.setAttribute("color", "red");
    console.log(this.element);
    this.element.style.color = "black"
    console.log(this.element);
  }

}
