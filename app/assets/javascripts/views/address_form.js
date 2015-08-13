HeadOutdoors.Views.AddressForm = Backbone.CompositeView.extend({
  template: JST['address_form'],

  tagName: 'form',

  className: 'address-form',

  render: function(){
    var content = this.template({ address: this.model });
    this.$el.html(content);
    this.$el.attr("role", "form")
    return this;
  }
});
