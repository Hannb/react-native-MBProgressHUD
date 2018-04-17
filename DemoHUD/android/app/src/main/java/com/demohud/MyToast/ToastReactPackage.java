package com.demohud.MyToast;


import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ToastReactPackage implements ReactPackage {
    /**
     *
     * @param reactContext 上下文
     * @return 需要调用的原生控件
     */
    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        return Collections.emptyList();
    }

    /**
     *
     * @param reactContext 上下文
     * @return 需要调用的原生模块
     */
    @Override
    public List<NativeModule> createNativeModules(
            ReactApplicationContext reactContext) {
        List<NativeModule> modules = new ArrayList<>();

        modules.add(new ToastModule(reactContext));

        return modules;
    }
}