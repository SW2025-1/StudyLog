import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "fullImage"]
  
  open(event) {
      const clickedImage = event.currentTarget.src
      const modalImg = this.fullImageTarget
      const modal = this.modalTarget
      
      modalImg.src = clickedImage
      modal.style.display = "flex"
  }
  
  close() {
      this.modalTarget.style.display = "none"
  }
}
