TodoModel = require '../models/Todo'
console.log TodoModel

class Todo extends Backbone.Collection
  model: TodoModel

  intialize: ->
    debugger

  showTodo: (text) ->
    _.each @where(text:text), (todo) ->
      todo.toggleActive()


module.exports = Todo
