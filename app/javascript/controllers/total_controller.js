import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
static targets = ["start", "end", "final", "cost"]
  connect() {
    console.log(this.startTarget.innerText)
  }
  calculate(e) {
    let startDate = this.startTarget.value
    let endDate = this.endTarget.value
    let cost = this.costTarget.innerHTML
    // console.log(cost)
    const date1 = new Date(startDate);
    const date2 = new Date(endDate);
    const diffTime = Math.abs(date2 - date1);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
    const finalCost = diffDays * cost
    // console.log(finalTotalTarget)
    if (finalCost) { this.finalTarget.innerHTML=`${finalCost}` 
    } else {
    this.finalTarget.innerHTML= " "
    }
    
  }
}
