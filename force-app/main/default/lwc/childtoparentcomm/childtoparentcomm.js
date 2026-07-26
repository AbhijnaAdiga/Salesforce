import { LightningElement } from 'lwc';

export default class Childtoparentcomm extends LightningElement {
    Productname;

    handleclick(){
        this.Productname='Iphone 17 Pro Max';
        const event = new CustomEvent('productevent',
             { detail: this.Productname 
                
             });
             console.log('Product:'+this.Productname);
            this.dispatchEvent(event);
    }
}