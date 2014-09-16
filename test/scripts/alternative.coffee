{Robot, User, TextMessage} = require 'hubot'
assert = require 'power-assert'
path = require 'path'
sinon = require 'sinon'

describe 'alternative', ->
  beforeEach (done) ->
    @sinon = sinon.sandbox.create()
    # for warning: possible EventEmitter memory leak detected.
    # process.on 'uncaughtException'
    @sinon.stub process, 'on', -> null
    @robot = new Robot(path.resolve(__dirname, '..'), 'shell', false, 'hubot')
    @robot.adapter.on 'connected', =>
      @robot.load path.resolve(__dirname, '../../src/scripts')
      setTimeout done, 10 # wait for parseHelp()
    @robot.run()

  afterEach (done) ->
    @robot.brain.on 'close', =>
      @sinon.restore()
      done()
    @robot.shutdown()

  describe 'listeners[0].regex', ->
    describe 'valid patterns', ->
      beforeEach ->
        @tests = [
          message: '@hubot alt h hello'
          matches: ['@hubot alt h hello', 'h', 'hello']
        ,
          message: '@hubot alternative hi hello !'
          matches: ['@hubot alternative hi hello !', 'hi', 'hello !']
        ]

      it 'should match', ->
        @tests.forEach ({ message, matches }) =>
          callback = @sinon.spy()
          @robot.listeners[0].callback = callback
          sender = new User 'bouzuya', room: 'hitoridokusho'
          @robot.adapter.receive new TextMessage(sender, message)
          actualMatches = callback.firstCall.args[0].match.map((i) -> i)
          assert callback.callCount is 1
          assert.deepEqual actualMatches, matches

  describe 'robot.helpCommands()', ->
    it '''
should be ["hubot alt[ernative] <new> <old> - define alternative command"]
''', ->
      assert.deepEqual @robot.helpCommands(), [
        'hubot alt[ernative] <new> <old> - define alternative command'
      ]
