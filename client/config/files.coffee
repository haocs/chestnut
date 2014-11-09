###
Exports a function which returns an object that overrides the default &
  plugin file patterns (used widely through the app configuration)

To see the default definitions for Lineman's file paths and globs, see:

  - https://github.com/linemanjs/lineman/blob/master/config/files.coffee
###

module.exports = (lineman) ->
  coffee:
    app: [
      'app/js/app.coffee'
      'app/js/models/**/*.coffee'
      'app/js/views/**/*.coffee'
      'app/js/router.coffee'
      'app/js/**/*.coffee'
    ]
    spec: 'spec/**/*.coffee'
    generated: 'generated/js/app.coffee.js'
    generatedSpec: 'generated/js/spec.coffee.js'
    generatedSpecHelpers: 'generated/js/spec-helpers.coffee.js'
  js:
    app: 'app/js/**/*.js'
    vendor: [
      'vendor/js/jquery.js'
      'vendor/js/underscore.js'
      'vendor/js/backbone.js'
      'vendor/js/bootstrap.js'
      'vendor/js/**/*.js'
    ]
    spec: 'spec/**/*.js'
    specHelpers: 'spec/helpers/**/*.js'
    concatenated: 'generated/js/app.js'
    concatenatedSpec: 'generated/js/spec.js'
    minified: 'dist/js/app.js'
    minifiedWebRelative: 'js/app.js'
