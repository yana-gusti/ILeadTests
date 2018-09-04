const {common_config, chromeCapabilities} = require('./common_config');

exports.config = Object.assign({}, common_config, {
  capabilities: Object.assign(chromeCapabilities, {
    proxy: {
      proxyType: 'MANUAL',
      httpProxy: '10.2.30.39:8080',
      sslProxy: '10.2.30.39:8080'
    }
  }),
  //proxy is used only for AWS test run
  maxInstances: 15,

  specs: ['features/**/*.feature']
});
