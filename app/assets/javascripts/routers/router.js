HeadOutdoors.Routers.Router = Backbone.Router.extend({
  routes: {
    '' : 'searchIndex',
    'activities/new' : 'newActivity',
    'activities/:id' : 'showActivity',
    'search/results' : 'showSearchResultsIndex',
    'browse/cities' : 'browseByCities',
    'browse/cities/:city' : 'browseByCity',
    'browse/categories' : 'browseByCategories',
    'browse/categories/:id' : 'browseByCategory',
    'users/:id' : 'showProfile'
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.activities = new HeadOutdoors.Collections.Activities();
    this.user = new HeadOutdoors.Models.User({ id: HeadOutdoors.CURRENT_USER.id });
    this.user.fetch();
  },

  showProfile: function() {
    var showProfileView = new HeadOutdoors.Views.ProfileShow({
      model: this.user
    });

    this._swap(showProfileView);
  },

  browseByCategory: function(id) {
    var categoryLinks = new HeadOutdoors.Collections.CategoryLinks();
    var queriedActivities = new HeadOutdoors.Collections.Activities();
    var category = new HeadOutdoors.Models.Category({ id: id });
    var browseByCategoryView = new HeadOutdoors.Views.BrowseCategoryIndex({
      collection: queriedActivities,
      model: category
    });

    category.fetch();
    categoryLinks.fetch({ data: $.param({ category_id: id }),
      success: function(links) {
        links.each(function(link) {
          var activity = new HeadOutdoors.Models.Activity({
            id: link.get('activity_id')
          });
          activity.fetch();
          queriedActivities.add(activity);
        });
      }
    });

    this._swap(browseByCategoryView);
  },

  browseByCategories: function() {
    var allCategories = new HeadOutdoors.Collections.Categories();
    var browseByCategoriesView = new HeadOutdoors.Views.BrowseByCategories({
      collection: allCategories
    });

    allCategories.fetch();
    this._swap(browseByCategoriesView);
  },

  browseByCity: function(city) {
    var queriedActivities = new HeadOutdoors.Collections.SearchResults();
    var browseCityIndexView = new HeadOutdoors.Views.BrowseCityIndex({
      city: city,
      collection: queriedActivities
    });

    queriedActivities.fetch({ data: $.param({ city: city }) });
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
      model: activity,
      user: this.user
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
