import { LightningElement } from 'lwc';

export default class NewLWC extends LightningElement {
    constructor(){
        super();
        console.log('constructor');
    }
    connectedCallback(){
        console.log('connectedCallback');
    }
    renderedCallback(){
        console.log('renderedCallback');
    }
    disconnectedCallback(){
        console.log('disconnectedCallback');
    }
    errorCallback(error, stack){
        console.log('errorCallback');
    }
}