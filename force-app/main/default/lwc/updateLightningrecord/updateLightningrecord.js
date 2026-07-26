import { LightningElement,api } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
export default class UpdateLightningrecord extends LightningElement {
    @api recordId;
    @api objectApiName;
    description='';

    handleinputchange(event){
        this.description=event.target.value;
    }
    handleUpdate(event){
        event.preventDefault();

        const fields={};
        fields['Id']=this.recordId;
        fields['Description'] = this.description;

        const recordInput = { fields };
        
        updateRecord(recordInput)
        .then(record =>{
            alert('Record Updated!');
        })
    }

}