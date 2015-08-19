HeadOutdoors.Views.ReviewIndexItem = Backbone.CompositeView.extend({
  template: JST['review_index_item'],

  className: 'row',

  render: function() {
    var content = this.template({ review: this.model });
    this.$el.html(content);
    this.$el.find('.raty-read-only').raty({
      readOnly: true,
      score: this.model.get('num_stars')
    });
    return this;
  }
});
