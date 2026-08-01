import { LightningElement,api } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
export default class CustomLWCform extends LightningElement {
    @api objectApiName;
    
    get options() {
        return [
            { label: 'APAC', value: 'APAC' },
            { label: 'EMEA', value: 'EMEA' },
            { label: 'Canada', value: 'Canada' },
            { label: 'USA', value: 'USA' },
        ];
    }
    saverecord(){
        let fields = {};

fields.Name =
    this.template.querySelector('[name="Uniname"]').value;

fields.Region__c =
    this.template.querySelector('[name="Region"]').value;

fields.Description__c =
    this.template.querySelector('[name="description"]').value;

    createRecord({
    apiName: this.objectApiName,
    fields
})
.then((result) => {
    console.log('Record Id = ' + result.id);
});
    }
}