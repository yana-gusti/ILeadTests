module.exports = {
    vikePage: {
        url: "http://vike-fr.thinkmobiles.com/signIn",
        emailInput: by.css("[name='email']"),
        loginInput: by.css("[name='username']"),
        passwordInput: by.css("[name='password']"),
        loginButton: by.css("input[type='submit']"),
        errorMessage: by.css("[class='field-error ']")
    },

    vikeSignUp: {
        url: "http://vike-fr.thinkmobiles.com/signUp",
        emailInput: by.css("[type='email']"),
        signUpButton: by.css("[type='submit']"),
        errorMessage: '.field-error',
        haveAccountButton: by.css("[class='btn bordered']")
    }
};