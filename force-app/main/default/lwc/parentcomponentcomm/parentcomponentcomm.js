import { LightningElement } from 'lwc';
import {add,customvalid} from 'c/utilityfunction'

export default class Parentcomponentcomm extends LightningElement {
    productnamedetails;

    handleproductname(event){
        this.productnamedetails= event.detail;
        console.log('Productlist:'+this.productnamedetail);
        alert('Productlist:'+this.productnamedetails);

        let sum = add(6,9);
        alert('sum is:'+sum);
        customvalid();
    }
}