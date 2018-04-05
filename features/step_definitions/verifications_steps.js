const {Then} = require('cucumber');
const chai = require('chai');
const chaiAsPromised = require('chai-as-promised');
chai.use(chaiAsPromised);
const expect = chai.expect;
const pageObjects = require('../../test-data/page-objects');

Then(/^Page title is equal to "([^"]*)"$/, (title) => {
    return expect(browser.driver.getTitle()).to.eventually.equal(title);
});

Then(/^Error with text "([^"]*)" is displayed$/, (text) => {
    browser.ignoreSynchronization = true;
    const errorMessage = element(by.cssContainingText(pageObjects.vikeSignUp.errorMessage, text));
    return expect(errorMessage.isDisplayed()).to.eventually.equal(true);
});

// Then (/^No any errors on the screen$/,{timeout: 60 * 1000}, () => {
//    const element =  browser.driver.findElement(pageObjects.vikeSignUp.errorMessage);
//    return expect(element.isDisplayed()).to.eventually.equal(false);
// });

Then (/^No any errors on the screen$/,{timeout: 60 * 1000}, () => {

    return expect(browser.driver.isElementPresent(pageObjects.vikeSignUp.errorMessage).to.eventually.equal(false));
});


// user with this email already exists