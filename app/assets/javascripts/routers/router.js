HeadOutdoors.Routers.Router = Backbone.Router.extend({
  routes: {
    '' : 'searchIndex',
    'activities/new' : 'newActivity',
    'activities/:id' : 'showActivity',
    'search/results' : 'showSearchResultsIndex',
    'browse/cities' : 'browseByCities',
    'browse/cities/:city' : 'browseByCity'
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.activities = new HeadOutdoors.Collections.Activities();
  },

  browseByCity: function(city) {
    var queriedActivites = new HeadOutdoors.Collections.SearchResults();
    var browseCityIndexView = new HeadOutdoors.Views.BrowseCityIndex({
      city: city,
      collection: queriedActivites
    });
    
    queriedActivites.fetch({ data: $.param({ city: city }) });
    this._swap(browseCityIndexView);
  },

  browseByCities: function() {
    var cities = new HeadOutdoors.Collections.Cities();
    var browseByCitiesView = new HeadOutdoors.Views.BrowseByCities({
      collection: cities
    });

    cities.fetch();
    this._swap(browseByCitiesView);
  },

  searchIndex: function() {
    var searchIndexView = new HeadOutdoors.Views.SearchIndex({
      collection: this.activities
    });

    this._swap(searchIndexView);
  },

  newActivity: function() {
    var activityFormView = new HeadOutdoors.Views.ActivityForm({
      model: new HeadOutdoors.Models.Activity()
    });

    this._swap(activityFormView);
  },

  showActivity: function(id) {
    var activity = new HeadOutdoors.Models.Activity({ id: id });
    var activityShowForm = new HeadOutdoors.Views.ActivityShow({
      model: activity
    });

    activity.fetch();
    this._swap(activityShowForm);
  },

  showSearchResultsIndex: function() {
    var searchResultsIndexView = new HeadOutdoors.Views.SearchResultsIndex({
      collection: this.activities
    });

    this._swap(searchResultsIndexView);
  },

  _swap: function(view) {
    this.view && this.view.remove();
    this.view = view;
    this.$rootEl.html(this.view.render().$el);
  }
});
