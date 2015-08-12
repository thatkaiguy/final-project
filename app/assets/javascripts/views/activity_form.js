HeadOutdoors.Views.ActivityForm = Backbone.CompositeView.extend({
  template: JST['activity_form'],
  //
  // tagName = 'form',
  //
  // className = 'activity-form',
  initialize: function() {
    this.addAddressFormSubview();
  },

  events: {
    "submit .activity-form" : "saveActivity"
  },

  render: function(){
    var content = this.template({ activity: this.model });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addAddressFormSubview: function() {
    var addressFormView = new HeadOutdoors.Views.AddressForm({
      model: new HeadOutdoors.Models.Address()
    });
    this.addSubview('.div-address-form', addressFormView);
  },

  saveActivity: function(e) {
    e.preventDefault();

    var $frmActivity = $(e.currentTarget);
    var $frmAddress = $frmActivity.find('.address-form');

    var addressJSON = $frmAddress.serializeJSON();
    var activityJSON = $frmActivity.serializeJSON();

    // save address - on success save activity - on success navigate to activity
    debugger;

    var address = new HeadOutdoors.Models.Address(addressJSON);
    address.save({}, {
      success: function(address) {
        var activity = new HeadOutdoors.Models.Activity(activityJSON);
        activity.address_id = address.id;
        activity.save({}, {
          success: function(activity) {
            Backbone.history.navigate('#/activities/' + activity.id, {trigger: true})
          }
        })
      }
    });
  }
});
