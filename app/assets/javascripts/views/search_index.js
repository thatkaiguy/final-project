HeadOutdoors.Views.SearchIndex = Backbone.CompositeView.extend({
  template: JST['search_index'],

  events: {
    "submit div.row-search form" : "sendQuery"
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    this.attachTypeAhead();
    return this;
  },

  attachTypeAhead: function() {
    // TODO this is a naive implementation
    // add JSON files for prefetching later?

    var view = this;
    var cities = new HeadOutdoors.Collections.Cities();
    var cityNames = [];

    cities.fetch({
      success: function(collection) {
        collection.each(function(city) {
          cityNames.push(city.get('name'));
        });
        view._typeaheadCities = new Bloodhound({
          datumTokenizer: Bloodhound.tokenizers.whitespace,
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          local: cityNames
        });

        view.$el.find('.cities-typeahead').typeahead({
            hint: true,
            highlight: true,
            limit: 20
          }, {
          name: 'cities',
          source: view._typeaheadCities
        });
      }
    });

    var categories = new HeadOutdoors.Collections.Categories();
    var categoryLabels = [];

    categories.fetch({
      success: function(collection) {
        collection.each(function(category) {
          categoryLabels.push(category.get('label'));
        });
        view._typeaheadCategories = new Bloodhound({
          datumTokenizer: Bloodhound.tokenizers.whitespace,
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          local: categoryLabels
        });

        view.$el.find('.categories-typeahead').typeahead({
            hint: true,
            highlight: true,
            limit: 20
          }, {
          name: 'categories',
          source: view._typeaheadCategories
        });
      }
    });
  },

  sendQuery: function(e) {
    e.preventDefault();
    var $frm = $(e.currentTarget);
    var frmJSON = $frm.serializeJSON();
    var queriedActivities = new HeadOutdoors.Collections.SearchResults();
    var view = this;
    debugger;
    queriedActivities.fetch({ data: $.param( frmJSON ),
      success: function(activities) {
        // hand activities to search results page and navigate there
        view.collection.reset();
        activities.each(function(activity) {
          view.collection.add(activity);
        });

        Backbone.history.navigate("#/search/results")
      },
      errors: function() {
        // TODO handle error case
      }
    });
  }
});
