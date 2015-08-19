HeadOutdoors.Views.ReviewIndexItem = Backbone.CompositeView.extend({
  template: JST['review_index_item'],

  className: 'row',

  render: function() {
    var content = this.template({ review: this.model });
    this.$el.html(content);
    return this;
  }
});
