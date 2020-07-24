function validateEmail(mail)
{
    var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (mail.match(mailFormat)) {
        return true;
    }
    else {
        return false;
    }
}

function validatePIN(PIN) {
    debugger;
    var PINFormat = /[0-9]{6}/;
    if (PIN.match(PINFormat)) {
        return true;
    }
    else {
        return false;
    }
}