module.exports = class BaseModule extends Marionette.Module
  onStart: ->
    debugger
    console.log 'test'
    @mainView = new @MainView(vent: @app.vent, collection: @collection)
    @listenTo @mainView, 'stop:notification:module', @stop

    @region.show(@mainView)

  onStop: ->
    @region.close()
