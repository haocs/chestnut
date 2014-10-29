
config = require './config'
utility = require './utility'


class MySQLService
  constructor: (host, port, username, password) ->
    @db = null
