HeadOutdoors.Views.SearchResultIndexItem = Backbone.CompositeView.extend({
  template: JST['search_result_index_item'],

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  tagName: 'div',

  className: 'search-result-index-item col-sm-6 col-md-3',

  render: function() {
    var content = this.template({ activity: this.model });
    this.$el.html(content);
    return this;
  }
})
