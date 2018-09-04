const {common_config, chromeCapabilities} = require('./common_config');

exports.config = Object.assign({}, common_config, {
  capabilities: chromeCapabilities,
  specs: ['features/Test.feature'],
  //using spread operator to copy tags in cucumberOptions
  cucumberOpts: { ...common_config.cucumberOpts, tags: ''}
});
