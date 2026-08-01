import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    productsfound = true;

    productList=[
        {id:'1',name:'Pixel',rating:'5/5'},
        {id:'2',name:'Apple',rating:'4/5'},
        {id:'3',name:'Realme',rating:'3/5'}
    ];
}