import { LightningElement,api} from 'lwc';

export default class ModalPopup extends LightningElement {
    isModalOpen = false;
    @api objectApiName;

    OpenModalHandle(){
        console.log('objectApiName:', this.objectApiName);
        this.isModalOpen = true;
    }



    handlesubmit(event){
        this.template.querySelector('lightning-record-edit-form').submit();
        this.isModalOpen = false;
    }
    resethandler(){
    let inputfield = this.template.querySelectorAll("lightning-input-field");
    inputfield.forEach((CurrItem) => CurrItem.reset()); 
     this.isModalOpen = false;
}
}