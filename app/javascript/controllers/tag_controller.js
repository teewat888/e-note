import { Controller } from "stimulus";
export default class extends Controller {
  static targets = ["name", "output"];
  toTitle({ params: { id } }) {
    if (!this.outputTarget.value.includes(id)) {
      this.outputTarget.value += id + " : ";
    } else {
      this.outputTarget.value = this.outputTarget.value.replace(id + " : ", "");
    }
  }
}
