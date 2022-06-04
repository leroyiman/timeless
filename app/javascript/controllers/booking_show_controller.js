import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("it works")
  }

  active1(event) {
    console.log(event)
    event.preventDefault()
    document.getElementById("newrequests").classList.remove("d-none")
    document.getElementById("confirmedbooking").classList.add("d-none")
    document.getElementById("declinedbooking").classList.add("d-none")
    document.getElementById("tabnewrequests").classList.add("active")
    document.getElementById("tabconfirmrequests").classList.remove("active")
    document.getElementById("tabdeclinerequests").classList.remove("active")
  }

  active2(event) {
    event.preventDefault()
    document.getElementById("newrequests").classList.add("d-none")
    document.getElementById("confirmedbooking").classList.remove("d-none")
    document.getElementById("declinedbooking").classList.add("d-none")
    document.getElementById("tabnewrequests").classList.remove("active")
    document.getElementById("tabconfirmrequests").classList.add("active")
    document.getElementById("tabdeclinerequests").classList.remove("active")
  }

  active3(event) {
    event.preventDefault()
    document.getElementById("newrequests").classList.add("d-none")
    document.getElementById("confirmedbooking").classList.add("d-none")
    document.getElementById("declinedbooking").classList.remove("d-none")
    document.getElementById("tabnewrequests").classList.remove("active")
    document.getElementById("tabconfirmrequests").classList.remove("active")
    document.getElementById("tabdeclinerequests").classList.add("active")
  }
}
