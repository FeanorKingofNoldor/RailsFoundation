import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect(){
    console.log("Connected", this.element)
  }

  triggerAlert(e){
    const { target: { dataset: { message } } } = e
    alert(message)
  }
}