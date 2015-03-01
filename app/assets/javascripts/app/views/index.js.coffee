class App.Views.News extends Backbone.View
  render: ->
    @$el.html('<h2>News</h2>')
    this

class App.Views.Ads extends Backbone.View
  render: ->
    @$el.html('<h2>Ads</h2>')
    this