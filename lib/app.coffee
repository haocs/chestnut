express = require 'express'

config = require './config'
controllers = require './controllers'


app = do express
require('./middleware') app
chestnut = new controllers.Chestnut
require('./routes') app, chestnut

module.exports =
  start: (environment, port) ->
    config.PORT = port if port?
    config.ENVIRONMENT = environment if environment?

    @server = app.listen config.PORT, '0.0.0.0', ->
      console.log "#{new Date} Listening on port #{config.PORT} in #{config.ENVIRONMENT}"

  stop: ->
    do @server?.close
