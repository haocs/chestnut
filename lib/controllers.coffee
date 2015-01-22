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

  createSession: (req, res) =>
    if req.body? && req.body.referer_id? && req.body.referral_id?
      session_hash =
        referer_id: req.body.referer_id
        referral_id: req.body.referral_id
      @db.insert "INSERT INTO `Sessions` SET ?",
                 session_hash,
                 (err, db_result) ->
                   if err?
                     res.status(500).json err
                   else
                     res.status(200).json db_result.insertId
    else
      invalid_req_err =
          code: "INVALID_REQUEST_ERROR"
      res.status(500).json invalid_req_err

  getMessagesBySession: (req, res) =>
    sessionId = req.params.sessionid
    @db.query "SELECT * from Messages WHERE session_id=#{sessionId}", (err, rows) ->
      if err?
        res.status(500).json err
      else
        res.status(200).json rows

  getMessageByMsgId: (req, res) ->
    res.type 'text'
    res.send 'OK'

  insertMessageToSession: (req, res) =>
    if req.body? && req.body.sender_uid? && req.body.receiver_uid?
      msg_hash =
        session_id: req.params.sessionid
        sender_uid: req.body.sender_uid
        receiver_uid: req.body.receiver_uid
        content: req.body.content
      @db.insert "INSERT INTO `Messages` SET ?",
          msg_hash,
          (err, db_result) ->
            if err?
              res.status(500).json err
            else
              res.status(200).json db_result.insertId
    else
      invalid_req_err =
          code: "INVALID_REQUEST_ERROR"
      res.status(500).json invalid_req_err


module.exports = {
  Chestnut
}
