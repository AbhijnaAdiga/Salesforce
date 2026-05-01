import { LightningElement, api } from 'lwc';

export default class CustomValidation extends LightningElement {
    @api recordId;
    @api objectApiName;

    name = '';
    phone = '';

    handleChange(event) {
        let field = event.target.name;
        let value = event.target.value;

        if (field == 'Name') {
            this.name = value;

            const nameRegex = /^[A-Za-z ]*$/;

            if (!nameRegex.test(value)) {
                event.target.setCustomValidity(
                    'Name cannot contain numbers or special characters.'
                );
            } else {
                event.target.setCustomValidity('');
            }

        } else if (field == 'Phone') {
            this.phone = value;

            const phoneRegex = /^[0-9]{0,10}$/;

            if (!phoneRegex.test(value)) {
                event.target.setCustomValidity(
                    'Phone must contain only numbers and max 10 digits.'
                );
            } else {
                event.target.setCustomValidity('');
            }
        }

        event.target.reportValidity();
    }
     /*handleSubmit(event) {
    event.preventDefault();

    let isValid = true;

    // Get inputs
    const nameInput = this.template.querySelector(
        'lightning-input[name="Name"]'
    );

    const phoneInput = this.template.querySelector(
        'lightning-input[name="Phone"]'
    );

    // Get values
    const nameValue = nameInput.value;
    const phoneValue = phoneInput.value;

    // NAME VALIDATION
    const nameRegex = /^[A-Za-z ]*$/;

    if (!nameRegex.test(nameValue)) {
        nameInput.setCustomValidity(
            'Name cannot contain numbers or special characters.'
        );
        isValid = false;
    } else {
        nameInput.setCustomValidity('');
    }

    // PHONE VALIDATION
    const phoneRegex = /^[0-9]{10}$/;

    if (!phoneRegex.test(phoneValue)) {
        phoneInput.setCustomValidity(
            'Phone must be exactly 10 digits.'
        );
        isValid = false;
    } else {
        phoneInput.setCustomValidity('');
    }

    // Show validation
    nameInput.reportValidity();
    phoneInput.reportValidity();

    // Submit if valid
    if (isValid) {
        const fields = event.detail.fields;

        fields.Name = nameValue;
        fields.Contact_Number__c = phoneValue;

        this.template
            .querySelector('lightning-record-edit-form')
            .submit(fields);
    }
    }*/
}