import Dropdown from '@stimulus-components/dropdown'

export default class extends Dropdown {
  showResults() {
    if (this.menuTarget.classList.contains('hidden')) this.toggle();
  }

  checkCloseMenu() {
    if (!this.menuTarget.classList.contains('hidden')) this.toggle();
  }
}
