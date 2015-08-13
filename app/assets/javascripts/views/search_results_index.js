HeadOutdoors.Views.SearchResultsIndex = Backbone.CompositeView.extend({
  template: JST['search_results_index'],

  initialize: function() {
    this.listenTo(this.collection, 'add', this.addSearchResultItemSubview);
    this.collection.each(this.addSearchResultItemSubview.bind(this));
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addSearchResultItemSubview: function(activity) {
    // TODO add search result item class
  }
});
