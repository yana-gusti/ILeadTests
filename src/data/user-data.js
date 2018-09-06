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
