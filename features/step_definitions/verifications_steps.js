const {Then} = require('cucumber');
const chai = require('chai');
const chaiAsPromised = require('chai-as-promised');
chai.use(chaiAsPromised);
const expect = chai.expect;
const pageObjects = require('../../test-data/page-objects');


Then(/^Page title is equal to "([^"]*)"$/, (title) => {
    return expect(browser.driver.getTitle()).to.eventually.equal(title);
});

Then(/^Check profile form is visible$/, () => {
    const profileForm = browser.driver.findElement(pageObjects.vikeProfile.profileForm);
    return expect(profileForm.isDisplayed()).to.eventually.equal(true);
});

Then(/^Verify the text "([^"]*)" in the "([^"]*)" tag$/, (inText, tag) => {
    browser.ignoreSynchronization = true;

    switch(tag){
        case "h1" :
            let elem = element.all(pageObjects.vikeProfile.tagsH3).first();
            return elem.getText().then(function (outText) {
                return expect(outText).to.equal(inText)
            });

        case "h2" :
            let elem1 = element.all(pageObjects.vikeProfile.tagsH3).last();
            return elem1.getText().then(function (outText) {
                return expect(outText).to.equal(inText)
            });

        case "span1" :
            let elem2 = element.all(pageObjects.vikeProfile.tagsSpanTitle).first();
            return elem2.getText().then(function (outText) {
                return expect(outText).to.equal(inText)
            });

        case "span2" :
            let elem3 = element.all(pageObjects.vikeProfile.tagsSpanTitle).last();
            return elem3.getText().then(function (outText) {
                return expect(outText).to.equal(inText)
            });

        case "error1" :
            let elem4 = element.all(pageObjects.vikeProfile.tagsSpanError).first();
            return elem4.getText().then(function (outText) {
                return expect(outText).to.equal(inText)
            });

        case "error2" :
            let elem5 = element.all(pageObjects.vikeProfile.tagsSpanError).last();
            return elem5.getText().then(function (outText) {
                return expect(outText).to.equal(inText)
            });

        default:
            return false;
    }
});