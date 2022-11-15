import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["email"]

  copy() {
    navigator.clipboard.writeText(this.emailTarget.textContent);
    document.getElementsByClassName("notice")[0].innerText = 'copy email: ' + this.emailTarget.textContent
  }
}