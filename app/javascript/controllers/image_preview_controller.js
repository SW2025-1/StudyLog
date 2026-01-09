import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "preview"]
    
    preview() {
        const previewBox = this.previewTarget
        const files = this.inputTarget.files
        
        previewBox.innerHTML = ''
        
        Array.from(files).forEach(file => {
        if (!file.type.match('image.*')) return
        
        const reader = new FileReader()
        reader.onload = function(e) {
          const img = document.createElement('img')
          img.src = e.target.result
          img.style.height = '150px'
          img.style.objectFit = 'contain'
          img.style.border = '1px solid #ccc'
          img.style.marginRight = '10px'
          previewBox.appendChild(img)
        }
        reader.readAsDataURL(file)
        })
    }
}