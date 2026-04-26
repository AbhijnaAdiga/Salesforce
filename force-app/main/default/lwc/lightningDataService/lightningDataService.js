import { LightningElement ,api,wire} from 'lwc';
import website from "@salesforce/schema/College__c.Website__c";
import Name from "@salesforce/schema/College__c.Name";
import {getRecord} from "lightning/uiRecordApi";
export default class LightningDataService extends LightningElement {
    @api recordId;
    clgwebsite;
    clgname;

    @wire(getRecord,{
        recordId:"$recordId",
        fields:[Name,website]
    })
    collegedata({data,error}){
        if(data){
            console.log("data",data);
            this.clgwebsite= data.fields.Website__c.value;
            this.clgname= data.fields.Name.value;
        }else if(error){
            console.log("error",error);
        }
    }
}