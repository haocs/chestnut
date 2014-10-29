config = require './config'
utility = require './utility'
models = require './models'

class Chestnut
  constructor: (cb) ->
    do cb if cb?

  heartbeat: (req, res) ->
    res.type 'text'
    res.send 'OK'

  getSession: (req, res) =>
    sessionId = req.params.id
    res.status(200).json sessionId

module.exports = {
  Chestnut
}
