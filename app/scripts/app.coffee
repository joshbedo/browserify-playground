AppView = require './views/AppView'
NotificationModule = require './modules/notification/NotificationModule'
TodoModule = require './modules/todo/TodoModule'

class App extends Backbone.Marionette.Application
  initialize: ->
    console.log 'Initializing App'

    @addInitializer( (options) =>
      (new AppView()).render()
    )

    @addInitializer( (options) =>
      @addRegions({
        notificationRegion: {
          selector: '#notifications'
          regionType: ToggleableRegion
          module: @submodules.Notification
        }
        todoRegion: {
          selector: '#todos'
          regionType: ToggleableRegion
          module: @submodules.Todo
        }
      })
    )

    @addInitializer( (options) =>
      @router = new Backbone.Marionette.AppRouter()
      Backbone.history.start()
    )

    @module('Notification', NotificationModule)
    @module('Todo', TodoModule)

    @start()

module.exports = new App()

