import { LightningElement } from 'lwc';
import MYLOGO from '@salesforce/resourceUrl/Insta_Logo';
import ShowinPROD from '@salesforce/label/c.show_in_prod';


export default class ImportTutorial extends LightningElement {
    src = MYLOGO;
    
    get showinprd(){
        return  ShowinPROD;
    }


}