import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number, userId: Number }
  static targets = ["messages", "input"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data)},
      console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
    )


  }

  #insertMessageAndScrollDown(data) {
    const parsed_data = JSON.parse(data)
    const current_user = parsed_data["current_user"]
    const html = parsed_data["html"]
    console.log(current_user)
    console.log(this.userIdValue)

    this.messagesTarget.insertAdjacentHTML("beforeend", html)
    if (current_user !== this.userIdValue) {
      console.log("hello, it works!")
      console.log(this.messagesTarget.lastElementChild)
      this.messagesTarget.lastElementChild.classList.remove("message-right")
      this.messagesTarget.lastElementChild.classList.add("message-left")
    }
    console.log(JSON.parse(data))
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    document.getElementById("message_content").value = ""
  }

  // resetForm(event) {
  //   event.target.reset()
  //   console.log(event.target)
  // }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

}
