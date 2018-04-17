/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, {Component} from 'react';
import {
    Platform,
    StyleSheet,
    Text,
    View
} from 'react-native';

import ProgressHUD from "./src/ProgressHUD";
import HUD from "./src/HUD";

const instructions = Platform.select({
    ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
    android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {};
export default class App extends Component<Props> {

    onClick = () => {
        var progress = 0.1;

        ProgressHUD.showDeterminate({
            mode: 'annular', //"bar" or "annular"   default:"annular"
            title: "loading"
        });

        var interval = setInterval(function () {
            if (progress <= 1) {
                ProgressHUD.setProgress(progress);
            } else {
                ProgressHUD.dismiss();
                clearInterval(interval);
            }
            progress += 0.1;
        }, 1000);
    }

    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.welcome}>
                    MBProgressHUD
                </Text>
                <Text style={styles.instructions} onPress={this.onClick}>
                    1. show determinate
                </Text>
                <Text style={styles.instructions} onPress={() => {
                    ProgressHUD.showText('loading', 2000)
                }}>
                    2. show text.
                </Text>
                <Text style={styles.instructions} onPress={() => {
                    ProgressHUD.showSpinIndeterminate();
                    var interval = setInterval(function () {
                        ProgressHUD.dismiss()
                        clearInterval(interval);
                    }, 3000);
                }}>
                    3. show spin indeterminate.
                </Text>
                <Text style={styles.instructions} onPress={() => {
                    ProgressHUD.showSpinIndeterminate('loading');
                    var interval = setInterval(function () {
                        ProgressHUD.dismiss()
                        clearInterval(interval);
                    }, 3000);
                }}>
                    4. show loading with title.
                </Text>
                <Text style={styles.instructions} onPress={() => {
                    HUD.showLoadingHUD();
                    var interval = setInterval(function () {
                        HUD.hideLoadingHUD();
                        clearInterval(interval);
                    }, 4000);
                }}>
                    (1). show loading.
                </Text>
                <Text style={styles.instructions} onPress={() => {
                    HUD.showErrorHUDWith('error message...');
                    var interval = setInterval(function () {
                        HUD.hideLoadingHUD();
                        clearInterval(interval);
                    }, 3000);
                }}>
                    (2). show error.
                </Text>
                <Text style={styles.instructions}>
                    {instructions}
                </Text>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
});
