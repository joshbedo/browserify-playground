Todos = require './collections/Todos'
BaseModule = require '../BaseModule'

module.exports = class TodoModule extends BaseModule
  initialize: ->
    @MainView = require './views/MainView'

    console.log 'Initializing TodoModule'

    @startWithParent = true

    @collection = new Todos([
      { text: "Clean apartment", done: false }
      { text: "Learn Browserify+Marionette", done: true }
    ])

    @app.router.processAppRoutes @, {
      'todo/:text', 'showTodo'
    }

  onStart: ->
    super()
    console.log 'Starting TodoModule'

  onStop: ->
    super()
    console.log 'Stopping TodoModule'

  showTodo: (text) ->
    @collection.showTodo(text)

