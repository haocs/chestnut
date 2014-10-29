request = require 'request'

global.GET = (path, done, callback) ->
  request.get "http://localhost:23423#{path}", (err, res) ->
    try
      res.json = JSON.parse res.body
    catch e

    callback err, res
    do done

global.POST = (path, data, done, callback) ->
  request.post
    url: "http://localhost:23423#{path}"
    json: data
  ,
    (err, res) ->
      callback err, res
      do done
