HeadOutdoors.Views.BrowseCityIndex = Backbone.CompositeView.extend({
  template: JST['browse_city_index'],

  initialize: function(options) {
    this.city = options.city;
    this.listenTo(this.collection, 'add', this.addBrowseCityIndexItemSubview);
    this.collection.each(this.addBrowseCityIndexItemSubview.bind(this));
  },

  className: 'browse-city-index-wrapper',

  render: function() {
    var content = this.template({ city: this.city });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addBrowseCityIndexItemSubview: function(activity) {
    var searchResultItemView = new HeadOutdoors.Views.SearchResultIndexItem({
      model: activity
    });

    this.addSubview('.city-results-list', searchResultItemView);
  }
});
