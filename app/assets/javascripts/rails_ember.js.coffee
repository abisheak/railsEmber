#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self


###
RailsEmber.Store = DS.Store.extend(
	revision: 11
	adapter: "DS.FixtureAdapter" 
)

RailsEmber.Post = DS.Model.extend(
	title: DS.attr("string")
	author: DS.attr("string")
	intro: DS.attr("string")
	extended: DS.attr("string")
	publishedAt: DS.attr("date") 
);

RailsEmber.PostsRoute = Ember.Route.extend(model: ->
	RailsEmber.Post.find()
)

RailsEmber.PostController = Ember.Controller.extend(
	isEditing: false
	edit: ->	
		@set "isEditing", true
		
	doneEditing: ->
		@set "isEditing", false
)

RailsEmber.IndexRoute = Ember.Route.extend(
	@transitionTo "posts"
) 

Ember.Handlebars.registerBoundHelper "date", (date) ->
	moment(date).fromNow()
	
window.showdown = new Showdown.converter()

Ember.Handlebars.registerBoundHelper "markdown", (input) -> 
	new Ember.Handlebars.SafeString(window.showdown.makeHtml(input))
###	
