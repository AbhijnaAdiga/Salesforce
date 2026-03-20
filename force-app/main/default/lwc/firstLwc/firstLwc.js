import { LightningElement } from 'lwc';

export default class FirstLwc extends LightningElement {
        fullname="zero to hero"
        title="aura developer"
   
    changeHandler(event){
        this.title=event.target.value;
    }


}