var CQHUD = require('react-native').NativeModules.CQHUD;
//var IsAndroid = CQHUD.IsAndroid;


var determinateMode = {
    "annular":0,
    "bar":1
};

var ProgressHUD = function () {
    this.determinateMode = determinateMode["annular"];
};

ProgressHUD.prototype.setDeterminateMode = function (mode) {
    if(determinateMode[mode] !== null){
        this.determinateMode = determinateMode[mode];
    }
};
ProgressHUD.prototype.showText = function (message = 'default', duration = 2000) {
    CQHUD.showText(message,duration);
};
ProgressHUD.prototype.dismiss = function () {
    CQHUD.dismiss();
};
ProgressHUD.prototype.showSpinIndeterminate = function () {
    var args = [].slice.call(arguments);

    // alert(args.length);

    if(args.length === 0){
        CQHUD.showSpinIndeterminate();
    } else if(args.length === 1 && typeof args[0] == 'string'){
        CQHUD.showSpinIndeterminateWithTitle(args[0]);
    } else if(args.length === 2 && typeof args[0] == 'string' && typeof args[1] == 'string'){
        CQHUD.showSpinIndeterminateWithTitleAndContent(args[0],args[1]);
    } else {
        throw Error("params error");
    }
};
ProgressHUD.prototype.showDeterminate = function ({mode,title,details} = {}) {
    var modeIndex = 0;
    if(determinateMode[mode] !== null && determinateMode[mode] !== undefined){
        modeIndex = determinateMode[mode];
    } else {
        modeIndex = this.determinateMode;
    }
    CQHUD.showDeterminate(modeIndex,title,details);
};
ProgressHUD.prototype.setProgress = function (progress) {
    if(typeof progress == 'number'){
        CQHUD.setProgress(progress);
    } else {
        throw Error('params must Number type');
    }
};

export default new ProgressHUD();