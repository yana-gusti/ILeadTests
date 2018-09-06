exports.config = thisModule = {
    seleniumAddress: 'http://127.0.0.1:4444/wd/hub',
    getPageTimeout: 60000, //60 sec
    allScriptsTimeout: 60000,//60 seconds
    ScriptTimeoutError: 60000,//60 seconds
    ignoreUncaughtExceptions: true, //This allows cucumber to handle the exception and record it appropriately.
    framework: 'custom',
    // path relative to the current config file
    frameworkPath: require.resolve('protractor-cucumber-framework'),
    multiCapabilities: [
        {
            'browserName': 'Chrome',
            chromeOptions: {
                args: ['disable-infobars', 'no-sandbox', 'window-size=1024,768', 'headless',
                    'disable-notifications', 'incognito',
                    'disable-application-cache'],
            },

            shardTestFiles: true,
            maxInstances: 5,
            specs: ['src/features/ilead-features/*.feature']
        }
    ],

    cucumberOpts: {
        require: ['step-definitions/*.js', 'support/hooks.js', 'support/cucumber-expressions.js'],
        keepAlive: false,
        format: ['json:reports/json/results.json', 'progress'],
        strict: true,
    },

    params: {
        env: process.env.TEST_ENV || 'DEV',
        timeOut: 10000,
    },
    maxSessions: 3,
    plugins: [{
        package: 'protractor-multiple-cucumber-html-reporter-plugin',
        options: {
            // read the options part https://www.npmjs.com/package/protractor-multiple-cucumber-html-reporter-plugin#options
            automaticallyGenerateReport: true,
            displayDuration: true,
            durationInMS: true,
            saveCollectedJSON: true
        }
    }]
};