import { LightningElement } from "lwc";
import getsObjects from "@salesforce/apex/dynamicapex.getAllObjects";
import retrieveRecords from "@salesforce/apex/dynamicapex.retrieveRecords";
export default class DynamicApex extends LightningElement {
    options = [];
    columns = [
        { label: "Id", fieldName: "Id" },
    ]
    data = [];
  connectedCallback() {
    getsObjects()
      .then((result) => {
        this.options = result.map((item) => ({
          label: item.MasterLabel,
          value: item.QualifiedApiName
        }));
      })
      .catch((error) => {
        console.log(error);
      });
  }

    handleChange(event) {
        let apiname = event.detail.value.toString();
        retrieveRecords( {objectType:apiname} )
          .then((result) => {
            this.data = result;
          })
          .catch((error) => {
        console.log(error);
          });
  }
}
