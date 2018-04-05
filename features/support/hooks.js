//Multiple Before hooks are executed in the order that they were defined. Multiple After hooks are executed in the reverse order that they were defined.
const { BeforeAll, After, Status } = require("cucumber");
const { browser } = require("protractor");
const { config } = require("../../conf.js");


//https://github.com/cucumber/cucumber-js/blob/master/docs/support_files/attachments.md
// BeforeAll({timeout: 10*1000}, () => {
//     browser.get(config.baseURL);
// });

After(function(scenario) {
    var attach;
    if (scenario.result.status === Status.FAILED) {
        attach = this.attach; // cucumber's world object has attach function which should be used
        return browser.takeScreenshot().then(function(png) {
            const decodedImage = new Buffer(png, "base64");
            return attach(decodedImage, "image/png");
        });
    }

});