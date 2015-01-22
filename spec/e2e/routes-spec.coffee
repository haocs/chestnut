
describe "GET /hearbeat", ->
  When (done) -> GET "/heartbeat", done, (err, res) =>
    @result = res
  Then -> @result.statusCode == 200
  And -> @result.body == 'OK'

describe  "GET /session/1", ->
  When (done) -> GET "/session/1", done, (err, res) =>
    @result = res
  Then -> @result.statusCode == 200
  # TODO need check res json.

describe "POST /session", ->
  data =
    referer_id: 1
    referral_id: 1
  When (done) -> POST "/session", data, done, (err, res) =>
    @result = res
  Then -> @result.statusCode == 200

describe "GET /seesion/1/m", ->
  When (done) -> GET "/session/1/m", done, (err, res) =>
    @result = res
  Then -> @result.statusCode == 200

describe "GET /session/1/m/2", ->
  When (done) -> GET "/session/1/m/2", done, (err, res) =>
    @result = res
  Then -> @result.statusCode == 200
  And -> @result.body == 'OK'

describe "POST /session/1/m", ->
  request_data =
    sender_uid: 2
    receiver_uid: 1
    content: "Hey, I am testing this insert message function."
  When (done) -> POST "/session/1/m", request_data,  done, (err, res) =>
    @result = res
  Then -> @result.statusCode == 200
