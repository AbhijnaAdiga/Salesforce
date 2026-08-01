import { LightningElement,wire } from 'lwc';
import data from"@salesforce/apex/wiremethodapexclass.Opportunitywire"

const columns =[
   {label:"Id",fieldName:"Id"},
   {
        label: "Name",
        fieldName: "Name",
        type: "url",
        typeAttributes: {
            label: { fieldName: "Name" },
            target: "_self"
        }
    },
   {label:"AccountId",fieldName:"AccountId"},
   {label:"StageName",fieldName:"StageName"}
]
export default class Wiremethods extends LightningElement {
    columns=columns;
    opps=[];
    @wire(data)
    wiredOpps({ data, error }) {
        if (data) {
            this.opps=data;
            console.log(data);
        } else if (error) {
            console.error(error);
        }
    }
    
}