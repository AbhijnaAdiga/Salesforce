import { LightningElement,wire } from 'lwc';
import studentdata from"@salesforce/apex/wiremethods.studentwiremethod"

const columns =[
   {label:"Id",fieldName:"Id"},
   {label:"Name",fieldName:"Name"},
   {label:"Age__c",fieldName:"Age__c"}
]
export default class Wiremethods extends LightningElement {
    column=columns;
    @wire(studentdata) students;
}