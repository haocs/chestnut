config = require './config'
utility = require './utility'
models = require './models'

class Chestnut
  constructor: (cb) ->
    @db = new models.MySQLService config.MYSQL_HOST, config.MYSQL_PORT, config.MYSQL_USER, config.MYSQL_PASSWORD, config.MYSQL_DB
    do cb if cb?

  heartbeat: (req, res) ->
    res.type 'text'
    res.send 'OK'

  getSession: (req, res) =>
    sessionId = req.params.id
    @db.query "SELECT * from Sessions WHERE id=#{sessionId}" , (err, rows) ->
      if err?
        res.status(500).json err
      else
        res.status(200).json rows

module.exports = {
  Chestnut
}
