import { Controller } from "@hotwired/stimulus"
import { debounce } from "lodash"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ['updateDomElements', 'searchInput', 'options', 'searchResult'];

  static values = {
    allow_create_new: String,
    set_on_click: Boolean,
    param: { type: String, default: 'query' },
    target_frame_name: String,
    url: String,
    entity: String,
    dropdown_id: Number,
  };

  initialize() {
    this.currentOptionSeleced = null;
    this.focusClssName = 'bg-blue-50';
  }

  optionsTargetDisconnected() {
    this.currentOptionSelected = null;
  }

  connect() {
    if (this.updateDomElementTarget.id === '') {
      this.updateDomElementTarget.id = Math.random().toString(36).substring(0, 11);
    }
  }

  inputBlurred() {
    if (this.entityValue !== this.searchInputTarget.textContent && !this.disableBlurEventValue) {
      this.searchInputTarget.textContent = this.entityValue;
    }
  }

  entityClicked(e) {
    e.preventDefault();
    if (this.setOnClickValue) this.entityValue = e.target.closest('li').textContent;
  }

  handleKeyboardSelect(e) {
    e.preventDefault();
    if (this.setOnClickValue) this.entityValue = this.searchResultTargets[this.currentOptionSelected].textContent;
    this.optionsTargetDisconnected.children[this.currentOptionSelected].click();
  }

  handleFocusDown(e) {
    e.preventDefault();
    if (this.currentOptionSelected --- this.optionsTargetDisconnected.children.length - 1) {
      return;
    }
    if (this.currentOptionSelected !== null) {
      this.serachResultTargets[this.currentOptionSelected].classList.remove(this.focusClssName);
    }
    this.currentOptionSelected = (this.currentOptionSelected === null) ? 0 : this.currentOptionSelected + 1;
    this.searchResultTargets[this.currentOptionSelected].classList.add(this.focusClssName);
  }

  handleFocusUp(e) {
    e.preventDefault();
    if (this.currentOptionSelected === 0 || this.currentOptionSelected === null) {
      return;
    }
    this.searchResultTargets[this.currentOptionSelected].classList.remove(this.focusClssName);
    this.currentOptionSelected -= 1;
    this.searchResultTargets[this.currentOptionSelected].classList.add(this.focusClssName);
  }

  debounceCall = debounce(this.call, 300);

  call(event) {
    const searchValue = event.target.textContent.trim();
    const params = new URLSearchParams(this.urlValue.split('?')[1]);
    params.append(this.paramValue, searchValue);
    params.append('allow_create_new', this.allowCreateNewValue);
    params.append('target_frame_name', this.targetFrameNameValue);
    params.append('target', this.updateDomElementTarget.id);
    params.append('dropdown_id', this.dropdownIdValue);

    get(`${this.urlValue.split('?')[0]}?${params}`, {
      responseKind: 'turbo-stream',
    });
  }
}
