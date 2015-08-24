HeadOutdoors.Views.BrowseByCities = Backbone.CompositeView.extend({
  template: JST['browse_by_cities'],

  className: 'browse-by-cities-wrapper',

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function() {
    var content = this.template({
      cities: this.collection
    });

    this.$el.html(content);
    return this;
  }
});
