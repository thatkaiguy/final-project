HeadOutdoors.Views.SearchResultIndexItem = Backbone.CompositeView.extend({
  template: JST['search_result_index_item'],

  tagNam: 'li',

  render: function() {
    var content = this.template({ activity: this.model });
    this.$el.html(content);
    return this;
  }
})
