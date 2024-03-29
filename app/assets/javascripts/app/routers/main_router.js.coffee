class App.Routers.MainRouter extends Backbone.Router

  routes:
    "":  "index"
    "projects": "project"
    "projects/new": "newProject"
    "projects/:id": "showProject"
    "projects/edit/:id": "editProject"

  editProject: (id) ->
    @layoutViews()
    @contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))
    m = new App.Models.Project({ id: id })
    @contentView.swapMain(new App.Views.NewProject({ model: m }))

  showProject: (id) ->
    @layoutViews()
    @contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))
    m = new App.Models.Project({ id: id })
    @contentView.swapMain(new App.Views.ProjectDetails({ model: m }))

  newProject: ->
    @layoutViews()
    @contentView.swapMain(new App.Views.NewProject({ model: new App.Models.Project }))
    @contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))

  initialize: ->
    @headerView = new App.Views.Header()
    @contentView = new App.Views.Content()
    @footerView = new App.Views.Footer()

  index: ->
    @layoutViews()
    @contentView.swapMain(new App.Views.Ads())
    @contentView.swapSide(new App.Views.News())

  project: ->
    @layoutViews()
    @contentView.swapMain(new App.Views.Empty())
    @contentView.swapSide(new App.Views.Projects({ collection: new App.Collections.Projects }))

  layoutViews: ->
    $('#header').html(@headerView.render().el)
    $('#content').html(@contentView.render().el)
    $('#footer').html(@footerView.render().el)
