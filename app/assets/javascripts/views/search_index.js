HeadOutdoors.Views.SearchIndex = Backbone.CompositeView.extend({
  template: JST['search_index'],

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});
