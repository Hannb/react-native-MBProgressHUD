var CQProgressHUDModule = require('react-native').NativeModules.CQProgressHUDModule;

var HUD = {
    hideLoadingHUD:() => {
        CQProgressHUDModule.hideLoadingHUD();
    },
    showLoadingHUD:() => {
        CQProgressHUDModule.showLoadingHUD();
    },
    showErrorHUDWith:(message) => {
        CQProgressHUDModule.showErrorHUDWith(message);
    }
};

export default HUD;