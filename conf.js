exports.config = {
    framework: 'custom',
    ignoreUncaughtExceptions: true,
    frameworkPath: require.resolve('protractor-cucumber-framework'),

    seleniumAddress: 'http://localhost:4444/wd/hub',
    getPageTimeout: 60000,
    // allScriptsTimeout: 500000,
    cucumberOpts: {
        require: ['features/step_definitions/*.js',
                  'features/support/env.js',
            'features/support/hooks.js'
            ],
        keepAlive: false,
        format: ['json:reports/results.json', 'progress'],
        strict: true,
        tags: '@Regression'
    },

    baseURL:"http://vike-fr.thinkmobiles.com/signIn",
    capabilities: {
        'browserName': 'chrome',
        chromeOptions: {
            args: ['disable-infobars',
                'start-fullscreen',
                'no-sandbox',
                'test-type=browser', 'disable-notifications',
                //'incognito',
                'disable-application-cache'],
            prefs: {
                'download': {
                    'prompt_for_download': false,
                    'directory_upgrade': true
                }
            }
        },
        shardTestFiles: true,
        maxInstances: 1,
    },

    // Spec patterns are relative to this directory.
    specs: ['features/MyProfile.feature'],

    onComplete: function () {
        browser.close();
    },

    plugins: [{
        package: 'protractor-multiple-cucumber-html-reporter-plugin',
        options: {
            // read the options part https://www.npmjs.com/package/protractor-multiple-cucumber-html-reporter-plugin#options
            automaticallyGenerateReport: true,
            removeExistingJsonReportFile: true,
            openReportInBrowser: true
        }
    }]
};
