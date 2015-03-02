class App.Views.ProjectDetails extends Backbone.View

  template: HandlebarsTemplates['project_details']

  events:
    "click button.destroy": "deleteProject"

  deleteProject: ->
    return unless confirm("Are you sure?")
    @model.destroy
      success: -> App.Vent.trigger "project:destroy"

  initialize: ->
    @listenTo @model, "sync", @render
    @model.fetch()

  render: ->
    @$el.html(@template(@model.toJSON()))
    this