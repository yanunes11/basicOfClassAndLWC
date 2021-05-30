/**
 * 1 - IMPORT Object and its Fields
 * 2 - IMPORT ShowToastEvents
 * 3 - Create the objectApiName and the fieldName that it will be received by the html
 * 4 - Define HandleSUccess()
 * 5 - Define ToastEvent
 */

import { LightningElement } from 'lwc';
// 1 - IMPORT Object and its Fields
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
// 2 - IMPORT ShowToastEvents
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ContactCreator extends LightningElement {
    // 3 - Create the objectApiName and the fieldName that it will be received by the html
    objectApiName = CONTACT_OBJECT;
    fields = [FIRSTNAME_FIELD, LASTNAME_FIELD];

    // 4 - Define HandleSUccess()
    handleSuccess(event) {
        // 5 - Define ToastEvent
        const toastEvent = new ShowToastEvent({
            title: "Contact created",
            message: "Record Id: " + event.detail.Id,
            variant: "Success"
        });
        this.dispatchEvent(toastEvent);
    }
}