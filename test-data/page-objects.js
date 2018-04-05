module.exports = {
    vikePage: {

        statusBar: by.css("[class='user-status-text']"),
        logoutButton: by.css(".select-after-element button"),

        vikeURL: "http://vike-fr.thinkmobiles.com/",
        chatsURL: "http://vike-fr.thinkmobiles.com/chats/my",
    },

    vikeSignIn:{
        signUpURL: "http://vike-fr.thinkmobiles.com/signIn",
        loginInput: by.css("[name='username']"),
        passwordInput: by.css("[name='password']"),
        loginButton: by.css("input[type='submit']"),
    },

    vikeProfile:{
        profileForm: by.css("[class='form-section']"),
        profileButton: by.css("[class='fa fa-user-circle user-icon']"),
        uploadImgBtn : by.css("[class='text']"),
        oldPasswordInput: by.css("[name='old_password']"),
        newPasswordInput: by.css("[name='new_password']"),
        saveProfileButton: by.css("button[class='btn blue']"),
        closeProfileButton: by.css("[class='modal-close-btn']"),
        tagsH3: by.css("h3[class='section-title']"),
        tagsP: by.css("p[class='field-title']"),
        tagsSpan: by.css("[class='field-error ']"),
    },

    vikeNewProjectForm:{
        closeButton: by.css("button[class='modal-close-btn']"),

    },

    // emailInput: by.css("[name='email']"),

};