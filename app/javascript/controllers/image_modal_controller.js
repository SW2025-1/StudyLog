import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "fullImage"]
  
  open(event) {
      const clickedImage = event.currentTarget.src
      const modal = this.fullImageTarget
      const modalImg = this.modalTarget
      
      modal.src = clickedImage
      modalImg.style.display = "flex"
  }
  
  close() {
      this.modalTarget.style.display = "none"
  }
}
