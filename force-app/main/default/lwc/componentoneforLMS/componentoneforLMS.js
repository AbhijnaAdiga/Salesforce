import { LightningElement,wire } from 'lwc';
import {publish,MessageContext} from 'lightning/messageService'
import NewMessageChannel from '@salesforce/messageChannel/NewMessageChannel__c'

export default class ComponentoneforLMS extends LightningElement {
    recordId='a02gL00000MV6J0QAL';

    @wire(MessageContext)
    messagecontext;

    publishmessage(){
            
            const payload = {
                Id:this.recordId
            }
            
            publish(this.messagecontext,NewMessageChannel,payload);
            console.log(this.recordId);
    }
    
}