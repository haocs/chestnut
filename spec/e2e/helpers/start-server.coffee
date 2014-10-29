app = require './../../../lib/app'
beforeEach -> app.start 'development', 23423
afterEach -> do app.stop
