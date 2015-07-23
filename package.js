Package.describe({
  name: 'azfx:fileloader',
  version: '0.1.0',
  // Brief, one-line summary of the package.
  summary: 'Manages meteor application files load order & dependencies',
  // URL to the Git repository containing the source code for this package.
  git: 'https://github.com/azfx/fileloader',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.2');
  api.use('coffeescript');
  api.addFiles('fileloader.coffee');
  api.export("FileLoader");
});
