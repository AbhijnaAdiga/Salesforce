import { LightningElement,wire } from 'lwc';
import {subscribe,MessageContext} from 'lightning/messageService'
import NewMessageChannel from '@salesforce/messageChannel/NewMessageChannel__c'

export default class ComponenttwoforLMS extends LightningElement {
    
        receivedmsg='';
     @wire(MessageContext)
        messagecontext;

        connectedCallback(){
            console.log('Payload received');
            this.subscribestatus();
        }

        subscribestatus(){
            subscribe(this.messagecontext,NewMessageChannel,(payload) =>{ 
                    this.received(payload)
        });
        }
        received(payload){
            this.receivedmsg=payload.Id;
            console.log(payload.Id);
        }
}