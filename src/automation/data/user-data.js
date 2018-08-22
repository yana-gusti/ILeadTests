/**
 * This file is represented urls and users information.
 * PROJECT_NAME should be changed with appropriate project name.
 * PROJECT_NAME constructions can be as much as needed.
 *
 * urls are used in {landing-url} custom parameter type.
 * users are used in {user} custom parameter type.
 *
 * @example
 * User navigates to "PAGE_NAME"
 * User login
 */

module.exports = {
    urls: {
        ILead_Start_Page: {
            LOCAL:'https://app.ilead.io',
            AWS:'https://app.ilead.io',
            QA: 'https://app.ilead.io'
        },
        Ilead_SignIn_Page: {
            LOCAL:'https://app.ilead.io/#signIn',
            AWS:'https://app.ilead.io/#signIn',
            QA:'https://app.ilead.io/#signIn'
        },
        ILead_Home_Page: {
            LOCAL:'https://app.ilead.io/#emailVerification',
            AWS:'https://app.ilead.io/#emailVerification',
            QA:'https://app.ilead.io/#emailVerification'
        },
        ILead_Help_Page: {
            LOCAL:'https://ilead.io/help/',
            AWS:'https://ilead.io/help/',
            QA:'https://ilead.io/help/'
        },
        ILead_Main_Page:{
            LOCAL:'https://ilead.io/',
            AWS:'https://ilead.io/',
            QA:'https://ilead.io/'
        }
    },
    users: {
        ADMIN: {
            login: 'admin_login',
            password: 'admin_password'
        },
        USER: {
            login: 'user_login',
            password: 'user_password'
        }
    }
};
