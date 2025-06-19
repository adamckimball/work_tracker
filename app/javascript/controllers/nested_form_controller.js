import NestedForm from '@stimulus-components/rails-nested-form';

export default class extends NestedForm {
  connect() {
    super.connect();
  }

  remove(event) {
    event.preventDefault();
    const wrapper = event.target.closest(".nested-form-wrapper");
    const destroyField = wrapper.querySelector("input[data-destroy-field]");
    if (destroyField) {
      destroyField.value = "1";
    }
    wrapper.style.display = "none";
  }
}
