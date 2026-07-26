import { LightningElement,api} from 'lwc';
import Name from "@salesforce/schema/Lead.Name";
import Phone from "@salesforce/schema/Lead.Phone";
import Status from "@salesforce/schema/Lead.Status";
export default class LightningrecordForm extends LightningElement {
   @api objectApiName;
   @api recordId;
   fields=[Name,Phone,Status];
}