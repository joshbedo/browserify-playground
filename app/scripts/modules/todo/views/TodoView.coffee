module.exports = class TodoView extends Backbone.Marionette.ItemView
  template: require './templates/todo'
  className: ->
    'list-group-item' + if @model.get('active') then ' active' else ''

  ui:
    check: '.check'
    close: '.close'

  events:
    'click @ui.check': 'toggleCheck'
    'click @ui.close': 'removeTodo'

  initialize: (options) ->
    # TODO: probably a better way to pass vent
    @vent = options.vent

  modelEvents: 
    'change:done': 'render'
    'change:active': 'todoToggled'

  todoToggled: ->
    @$el.toggleClass('active')
    @vent.trigger 'new:notification', 'Selected/unselected todo: ' + @model.get('text')

  toggleCheck: ->
    @model.set('done', !@model.get('done'))
    @vent.trigger 'new:notification', 'Selected/unselected todo: ' + @model.get('text')

  removeTodo: ->
    @model.destroy()
    @vent.trigger 'new:notification', 'Removed todo: ' + @model.get('text')
