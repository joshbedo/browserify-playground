BaseModule = require '../BaseModule'

module.exports = class NotificationModule extends BaseModule
  intitialize: ->
    @MainView = require './views/MainView'

    console.log 'Intitializing NotificationModule'
    @startWithParent = false

  onStart: ->
    super()
    console.log 'Starting NotificationModule'

  onStop: ->
    super()
    console.log 'Stopping NotificationModule'
