module.exports = (app, controller) ->
  app.all '/heartbeat', controller.heartbeat

  # routing for Message
  app.get '/session/:sessionid/m', controller.getMessagesBySession
  app.post '/session/:sessionid/m', controller.insertMessageToSession
  app.get '/session/:sessionid/m/:msgid', controller.getMessageByMsgId

  # routing for Session
  #restrict :id to numbers ONLY
  app.get  '/session/:id([0-9]+)', controller.getSession
  app.post '/session', controller.createSession



