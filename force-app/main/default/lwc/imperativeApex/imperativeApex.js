import { LightningElement } from 'lwc';
import getAccountData from "@salesforce/apex/ImperativeApex.studentImperativeApex";
export default class ImperativeApex extends LightningElement {
data =[];
    columns =[
   {label:"Id",fieldName:"Id"},
   {label:"Name",fieldName:"Name"},
   {label:"Age__c",fieldName:"Age__c"}
]
    clickHandler(){
        getAccountData()
        .then((result) => {
            console.log('Data',result);
            this.data=result;
        })
        .catch((error) => {
            console.log('error',error);
        });
    }
}