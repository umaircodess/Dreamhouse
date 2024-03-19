import { LightningElement, track } from "lwc";

export default class TrackTrace extends LightningElement {
  name = "hello";
  @track object = {
    nname: "manmanmanmanmaamnam",
    age: 22,
    aia: "yes"
  };
  ontype() {
    this.object.nname = "bbbb";
  }
}
