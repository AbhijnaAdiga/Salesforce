import { LightningElement, api} from 'lwc';
import NAME_FIELD from "@salesforce/schema/Student__c.Name";
import DOB_FIELD from "@salesforce/schema/Student__c.DateOfBirth__c";
import FEES_FIELD from "@salesforce/schema/Student__c.Total_Fee__c";
import ClgleftDt_FIELD from "@salesforce/schema/Student__c.College_Left_Date__c";
import Discount_FIELD from "@salesforce/schema/Student__c.Fee_Discount__c";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { NavigationMixin } from "lightning/navigation";

export default class RecordForm extends NavigationMixin(LightningElement) {
@api recordId;
@api objectApiName;
Fieldslist=[NAME_FIELD,DOB_FIELD,FEES_FIELD];

 fieldMap = {
        clgleft: ClgleftDt_FIELD,
        discount: Discount_FIELD
    };

showToast() {

let event = new ShowToastEvent({
title: "Message",
success:"success",
message:
"Student Record Updated successfully!!.",
});
this.dispatchEvent(event);
const fields = event.detail.fields;
 console.log(JSON.stringify(event.detail.fields));
}

navigateToList(){
console.log('RecordId: ' + event.detail.id); 
let gotoview ={
type: "standard__recordPage",
attributes: {
recordId: event.detail.id,
objectApiName: this.objectApiName,
actionName: "view",
}

};
this[NavigationMixin.Navigate](gotoview);
}



}