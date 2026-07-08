import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "trigger", "formContainer", "form", "step1", "step2",
    "preset", "amountInput", "customAmount",
    "recurring", "recurringMonths", "submitBtn"
  ]

  show() {
    this.triggerTarget.classList.add("hidden")
    this.formContainerTarget.classList.remove("hidden")
  }

  connect() {
    const amount = parseInt(this.amountInputTarget.value)
    if (amount) {
      const match = this.presetTargets.find(p => parseInt(p.dataset.value) * 100 === amount)
      if (match) {
        this._selectPreset(match)
      } else {
        this.customAmountTarget.value = amount / 100
      }
    }
    this._syncRecurring()
  }

  selectPreset(event) {
    this._selectPreset(event.currentTarget)
  }

  customAmountChanged(event) {
    this.presetTargets.forEach(p => p.classList.remove("selected"))
    this.amountInputTarget.value = event.currentTarget.value
    this._updateSubmitBtn()
  }

  toggleRecurring() {
    this._syncRecurring()
  }

  next() {
    if (!this.amountInputTarget.value || parseInt(this.amountInputTarget.value) <= 0) return
    this.step1Target.classList.add("hidden")
    this.step2Target.classList.remove("hidden")
  }

  back() {
    this.step1Target.classList.remove("hidden")
    this.step2Target.classList.add("hidden")
  }

  _selectPreset(el) {
    this.presetTargets.forEach(p => p.classList.remove("selected"))
    el.classList.add("selected")
    this.customAmountTarget.value = el.dataset.value
    this.amountInputTarget.value = el.dataset.value
    this._updateSubmitBtn()
  }

  _syncRecurring() {
    if (this.hasRecurringTarget && this.hasRecurringMonthsTarget) {
      this.recurringMonthsTarget.classList.toggle("hidden", !this.recurringTarget.checked)
    }
  }

  _updateSubmitBtn() {
    const val = this.amountInputTarget.value
    if (val) {
      this.submitBtnTarget.value = `Donate ₪${val}`
    } else {
      this.submitBtnTarget.value = "Donate"
    }
  }
}
