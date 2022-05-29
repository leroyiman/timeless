import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

export default class extends Controller {

  static targets = ["timeslot"]


  connect() {
    console.log("Hello, Stimulus!", this.element)
    this.timeslots = [document.getElementById("offer_timeslots_attributes_0_timeslot"),document.getElementById("offer_timeslots_attributes_1_timeslot"),document.getElementById("offer_timeslots_attributes_2_timeslot"),document.getElementById("offer_timeslots_attributes_3_timeslot"),document.getElementById("offer_timeslots_attributes_4_timeslot")]
  }


  modal(event) {
      event.preventDefault()

      this.timeslots[0].parentElement.parentElement.parentElement.classList.remove("d-none")
      console.log(this.timeslots[0])
      this.timeslots.shift()
      console.log(this.timeslots[0])

      // let clone = document.getElementById("timeslot").cloneNode(true)
      // console.log(clone)
      // document.getElementById("timeslot_container").appendChild(clone)

      // let variable = document.getElementById("timeslot_container")
      // console.log(variable.getElementsByTagName('*').length >= 20)

      // if (variable.getElementsByTagName('*').length >= 20){
      //   document.getElementById("button").classList.add("d-none")
      // }

    }
}
