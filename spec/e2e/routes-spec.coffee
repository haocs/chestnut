
describe "GET /hearbeat", ->
  When (done) -> GET "/heartbeat", done, (err, res) =>
    @result = res
  Then -> @result.statusCode == 200
  And -> @result.body == 'OK'
