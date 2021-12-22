function checkValue(arg, msg) {
    var argVal = arg.value;

    if(argVal.trim() == '') {
        alert(msg);
        arg.focus();
        return true;
    } else {
        return false;
    }
}