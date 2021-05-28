/*
    BASIC STRUCTURE OF CREATING AN ACCOUNT USING LWC
    1. IMPORT the LightningElement - (basic class for LWC wich allows us to use connectedCallBack())
    1.1. ConnetedCallBack() method is triggered when a component is inserted in the DOM. It's start the timer.
    2. IMPORT the OBJECT you want to work to - It ensures that the Object exists
    3. IMPORT the FIELDS you want to show on a screen - It ensures that the Fields exist
    POINT 2. AND 3. both ensures that the they are included in change sets and ensures that your component stills working if the name of the object and field are renamed.
    4. IMPORT ShowToastEvent if you want it the screen showing up some message
    5. Write inside the class the APIname and fields
    6. Define a HandleSuccess() that is executed when the saving operation succeeds.
    7. ToastEvent - It is a pop up notification when an event occurs with success, warning or error
*/

// 1. IMPORT the LightningElement
import { LightningElement } from 'lwc';
//2. IMPORT the OBJECT
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
//3. IMPORT the FIELDS
import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce]/schema/Account.AnnualRevenue';
import ACTNUMBER_FIELD from '@salesforce/schema/Account.AccountNumber';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
// 4. IMPORT ShowToastEvent
import { ShowToastEvent } from 'Lightning/platformShowToastEvent';

export default class AccountCreator extends LightningElement {
    // 5. Write inside the class the APIname and fields
    objectApiName = ACCOUNT_OBJECT;
    fields = [NAME_FIELD,REVENUE_FIELD, ACTNUMBER_FIELD, INDUSTRY_FIELD];
    // 6. Define a HandleSuccess()
    handleSuccess(event) {
        // 7. ToastEvent
        const toastEvent = new ShowToastEvent({
            title: "Account Created",
            message: "Record ID: " + event.detail.id,
            variant: "Success"
        });
        this.dispatchEvent(toastEvent);
    }
}/