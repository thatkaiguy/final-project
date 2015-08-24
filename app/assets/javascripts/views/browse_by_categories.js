HeadOutdoors.Views.BrowseByCategories = Backbone.CompositeView.extend({
  template: JST['browse_by_categories'],

  className: 'browse-by-categories-wrapper',

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function() {
    var content = this.template({ categories: this.collection });
    this.$el.html(content);
    return this;
  }
});
