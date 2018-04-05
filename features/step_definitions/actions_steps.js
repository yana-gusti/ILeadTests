const {setDefaultTimeout, Given, When} = require('cucumber');
const pageObjects = require('../../test-data/page-objects');

Given(/^Users prints comment "([^"]*)"$/, (comment) => {
    return console.log(comment);
});

When(/^Users wait (\d+) sec.$/, (s) => {
    return browser.driver.sleep(s * 1000);
});

When(/^Users navigates to the Login page$/, () => {
    return browser.driver.get(pageObjects.vikeSignIn.signUpURL);
});

// Users enter to "webElement" value "value"
When(/^Users enter to "([^"]*)" value "([^"]*)"$/, (webElement, val) => {
    switch(webElement){
        case "Login":
            return browser.driver.findElement(pageObjects.vikeSignIn.loginInput).sendKeys(val);

        case "Password":
            return browser.driver.findElement(pageObjects.vikeSignIn.passwordInput).sendKeys(val);

        case "oldPassword":
            return browser.driver.findElement(pageObjects.vikeProfile.oldPasswordInput).sendKeys(val);

        case "newPassword":
            return browser.driver.findElement(pageObjects.vikeProfile.newPasswordInput).sendKeys(val);

        default:
            return null;
    }
});
// End users enter . . .


// Users click on "webElement"
When(/^Users click on "([^"]*)"$/, (item) => {
    switch(item){
        case "closeProjectForm":
            return browser.driver.findElement(pageObjects.vikeNewProjectForm.closeButton).click();

        case "statusBar":
            return browser.driver.findElement(pageObjects.vikePage.statusBar).click();

        case "loginBtn":
            return browser.driver.findElement(pageObjects.vikeSignIn.loginButton).click();

        case "logOutBtn":
            browser.ignoreSynchronization = true;
            let buttons = element.all(pageObjects.vikePage.logoutButton).last();
            return buttons.click();

        case "myProfile":
            return browser.driver.findElement(pageObjects.vikeProfile.profileButton).click();

        case "saveBtn":
            return browser.driver.findElement(pageObjects.vikeProfile.saveProfileButton).click();

        case "closeProfileForm":
            return browser.driver.findElement(pageObjects.vikeProfile.closeProfileButton).click();

        case "":
            return "";

        default:
            return false;
    }
});
// End Users clicks



