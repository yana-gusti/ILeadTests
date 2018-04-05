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

Then(/^Check the text "([^"]*)"$/, (inText) => {
    browser.ignoreSynchronization = true;
    let elem = element.all(pageObjects.vikeProfile.tagsH3).last();

    return elem.getText().then(function (outText) {
        console.log(outText);
        return expect(outText).to.equal(inText)
    })
});