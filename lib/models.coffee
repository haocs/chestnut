mysql = require 'mysql'

config = require './config'
utility = require './utility'


class MySQLService
  constructor: (host, port, username, password, db) ->
    @connection = mysql.createConnection
      host: host
      port: port
      user: username
      password: password
      database: db
    do @connection.connect

  query: (query, cb) ->
    @connection.query query, (err, rows, fields) ->
      cb err, rows, fields

  insert: (query, set, cb) ->
    @connection.query query, set, (err, result) ->
      cb err, result
module.exports = {
  MySQLService
}
