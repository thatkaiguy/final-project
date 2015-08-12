HeadOutdoors.Routers.Router = Backbone.Router.extend({
  routes: {
    '' : 'searchIndex',
    'activities/new' : 'newActivity',
    'activities/:id' : 'showActivity'
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  searchIndex: function() {
    var searchIndexView = new HeadOutdoors.Views.SearchIndex();

    this._swap(searchIndexView);
  },

  newActivity: function() {
    var activityFormView = new HeadOutdoors.Views.ActivityForm({
      model: new HeadOutdoors.Models.Activity()
    });

    this._swap(activityFormView);
  },

  showActivity: function(id) {

  },

  _swap: function(view) {
    this.view && this.view.remove();
    this.view = view;
    this.$rootEl.html(this.view.render().$el);
  }
});
