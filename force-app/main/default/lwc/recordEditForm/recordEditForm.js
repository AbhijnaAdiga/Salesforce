import { LightningElement,api } from 'lwc';
import Website from "@salesforce/schema/College__c.Website__c";
import Name from "@salesforce/schema/College__c.Name";
import Address from "@salesforce/schema/College__c.Address__c";
import About_College from "@salesforce/schema/College__c.About_College__c";
import { NavigationMixin } from "lightning/navigation";

export default class RecordForm extends NavigationMixin(LightningElement) {
@api recordId;
@api objectApiName;

fields = {
    Name:Name,
    Website:Website,
    Address:Address,
    About_College:About_College
};
navigateToListview(){
let gotoview ={
type: "standard__objectPage",
attributes: {
objectApiName: this.objectApiName,
actionName: "list",
}
};
this[NavigationMixin.Navigate](gotoview);
}

errorhandler(event) {
    console.log('Error: ' +JSON.stringify(event.detail));
    const cevent=new ShowToastEvent({
        title:"Error",
        message:event.detail.output.fieldErrors,
        variant:"error"
    });
    this.dispatchEvent(cevent);
    
}
resethandler(){
    let inputfield = this.template.querySelectorAll("lightning-input-field");
    inputfield.forEach((CurrItem) => CurrItem.reset()); 
}
}