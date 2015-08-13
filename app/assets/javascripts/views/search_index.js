HeadOutdoors.Views.SearchIndex = Backbone.CompositeView.extend({
  template: JST['search_index'],

  events: {
    "submit div.row-search form" : "sendQuery"
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  sendQuery: function(e) {
    e.preventDefault();
    var $frm = $(e.currentTarget);
    var frmJSON = $frm.serializeJSON();
    var queriedActivities = new HeadOutdoors.Collections.SearchResults();
    var view = this;

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
