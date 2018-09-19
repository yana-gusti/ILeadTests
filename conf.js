const osHomedir = require('os').homedir;
const fs = require('fs');
var path = require('path');
var fileSep = path.sep;
const downloadDir = "test_file" + fileSep + "test";

exports.config = thisModule = {
    seleniumAddress: 'http://127.0.0.1:4444/wd/hub',
    getPageTimeout: 60000, //60 sec
    allScriptsTimeout: 60000,//60 seconds
    ignoreUncaughtExceptions: true, //This allows cucumber to handle the exception and record it appropriately.
    framework: 'custom',
    restartBrowserBetweenTests: true,
    // path relative to the current config file
    frameworkPath: require.resolve('protractor-cucumber-framework'),
    capabilities: {
        'browserName': 'chrome',
        acceptSslCerts: true,
        chromeOptions: {
            args: ['disable-gpu', 'window-size=1920,1080',
                'test-type=browser', 'incognito',
                'disable-application-cache','headless'],
            // Set download path and avoid prompting for download even though
            // this is already the default on Chrome but for completeness
            prefs: {
                'download': {
                    'prompt_for_download': false,
                    'default_directory': downloadDir,
                    'directory_upgrade': true,
                    // Disable Chrome's annoying password manager
                    'profile.password_manager_enabled': false,
                    'credentials_enable_service': false,
                    'password_manager_enabled': false
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
        maxInstances: 5,
    },

    //specs: ['src/features/ilead-features/*.feature'],
    specs:['src/features/ilead-features/func_test.feature'],
    //specs: ['src/features/ilead-features/reg_and_login.feature'],

    baseURL: '',

    //Don't use pretty format when run tests in parallel.
    cucumberOpts: {
        require: ['src/step-definitions/*.js', 'src/support/hooks.js'],
        keepAlive: false,
        format: ['json:reports/results.json', 'progress'],
        strict: true,
        //tags: ['@Debug'],
    },

    onPrepare: function () {
        //variable for creating and working with unique string values during one session
        fs.readFile('storage.json', (err, data) => {
            if (err) return global.uniqueMap = {};
            global.uniqueMap = JSON.parse(data);
        });
    },

    onComplete: function () {
        fs.writeFile('storage.json', JSON.stringify(uniqueMap));
    },

    params: {
        timeout: 3000,
        env: process.env.TEST_ENV || 'LOCAL',
        basePath: downloadDir,
        //definedParameterTypes: require('./features/support/parameter-types.js')
    },
    plugins: [{
        package: 'protractor-multiple-cucumber-html-reporter-plugin',
        options: {
            // read the options part https://www.npmjs.com/package/protractor-multiple-cucumber-html-reporter-plugin#options
            automaticallyGenerateReport: true,
            displayDuration: true,
            durationInMS: true,
            saveCollectedJSON: false
        }
    }]
};