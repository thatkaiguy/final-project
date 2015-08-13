// TODO delete this file if unused

HeadOutdoors.Views.BrowseCityIndexItem = Backbone.CompositeView.extend({
  template: JST['browse_city_index_item'],

  tagName: 'li',

  className: 'browse-city-index-item',

  render: function() {
    var content = this.template({ activity: this.model });
    this.$el.html(content);
    return this;
  }
});
