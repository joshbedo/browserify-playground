Todo = require '../models/Todo'

module.exports = class Todo extends Backbone.Collection
  model: Todo

  showTodo: (text) ->
    _.each @where(text:text), (todo) ->
      todo.toggleActive()
