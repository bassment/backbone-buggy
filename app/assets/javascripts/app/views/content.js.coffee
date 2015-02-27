class App.Views.Content extends Backbone.View

  className: "row"

  template: HandlebarsTemplates['content']

  render: ->
    @$el.html(@template())
    @renderEmptyView()
    this

  renderEmptyView: ->
    v = new App.Views.Empty()
    @$('#main-area').html(v.render().el)