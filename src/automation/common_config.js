const osHomedir = require('os').homedir;
const fs = require('fs');
const path = require('path');
const TEST_FOLDER_NAME = 'test' + path.sep + new Date().getTime();
const downloadDir = `${osHomedir() + path.sep + TEST_FOLDER_NAME}`;

exports.chromeCapabilities = {
    browserName: 'chrome',
    chromeOptions: {
        args: ['disable-infobars', 'headless','disable-gpu', 'window-size=1200,768',
            'test-type=browser', 'disable-notifications', 'incognito',
            'disable-application-cache'],
        // Set download path and avoid prompting for download even though
        // this is already the default on Chrome but for completeness
        // 'headless',
        prefs: {
            download: {
                prompt_for_download: false,
                default_directory: downloadDir,
                directory_upgrade: true,
                // Disable Chrome's annoying password manager
                'profile.password_manager_enabled': false,
                credentials_enable_service: false,
                password_manager_enabled: false
            }
        }
    },
    // allows different specs to run in parallel.
    // If this is set to be true, specs will be sharded by file
    // (i.e. all files to be run by this set of capabilities will run in parallel).
    // Default is false.
    shardTestFiles: true,

    // Maximum number of browser instances that can run in parallel for this
    // set of capabilities. This is only needed if shardTestFiles is true.
    // Default is 1.
    maxInstances: 3
};

exports.common_config = {
    seleniumAddress: 'http://127.0.0.1:4444/wd/hub',
    getPageTimeout: 60000, //60 sec
    allScriptsTimeout: 60000, //60 seconds
    ignoreUncaughtExceptions: true, //This allows cucumber to handle the exception and record it appropriately.
    framework: 'custom',
    // path relative to the current config file
    frameworkPath: require.resolve('protractor-cucumber-framework'),

    restartBrowserBetweenTests: true,

    baseURL: '',

    onPrepare() {
        //variable for creating and working with unique string values during one session
        fs.readFile('storage.json', (err, data) => {
            if (err) {
                global.uniqueMap = {};
                return;
            }
            global.uniqueMap = JSON.parse(data);
        });
    },

    //Don't use pretty format when run tests in parallel.
    cucumberOpts: {
        require: [
            'features/step-definitions/*.js',
            'features/support/hooks.js'
        ],
        keepAlive: false,
        format: [
            'json:reports/results.json',
            'progress'
        ],
        strict: true
        //tags: ['@Debug'],
    },

    onComplete() {
        fs.writeFile('storage.json', JSON.stringify(uniqueMap));
    },

    params: {
        timeout: 20000,
        env: process.env.TEST_ENV || 'LOCAL',
        basePath: downloadDir,
        fileDownloadGlobalWait: 300000 //5 min
        //definedParameterTypes: require('./features/support/parameter-types.js')
    },
    maxSessions: 3,
    plugins: [{
        'package': 'protractor-multiple-cucumber-html-reporter-plugin',
        options: {
            // read the options part https://www.npmjs.com/package/protractor-multiple-cucumber-html-reporter-plugin#options
            automaticallyGenerateReport:true,
            removeExistingJsonReportFile: true,
            openReportInBrowser: true,
            removeOriginalJsonReportFile: true,
            displayDuration: true,
            durationInMS: true
        }
    }]
};
