import { LightningElement,api ,wire } from 'lwc';
import UniversityDetails from "@salesforce/apex/UniversityDetails.UniversityDetailstable";
const columns = [
    {label:"Id",fieldName:"Id",editable:true},
    {label:"Name",fieldName:"Name",editable:true},
    {label:"Website",fieldName:"Website__c",editable:true},
    {label:"Zone",fieldName:"Zone__c",editable:true,type: 'picklist'},
    {label:"Region",fieldName:"Region__c",editable:true, type: 'picklist'}
];
export default class LightningDataTable extends LightningElement {
    @api recordId;
    Unidata = [];
    columns = columns;
    @wire(UniversityDetails ,{
        accountId:"$recordId"
    })
    getUniDetail({data,error}){
        if(data){
            this.Unidata = data;
            console.log('data:', data);
        }else if(error){
            console.log("Error!!");
        }
    }
}