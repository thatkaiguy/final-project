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
    this.$el.find('#activity_category').tagsinput();
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
    var categoriesJSON = $frmActivity.find('#activity_category').tagsinput('items');

    debugger
    // save address - on success save activity - on success navigate to activity
    var address = new HeadOutdoors.Models.Address(addressJSON);
    address.save({}, {
      success: function(address) {
        activityJSON.activity.address_id = address.id;
        var activity = new HeadOutdoors.Models.Activity(activityJSON);

        activity.save({}, {
          success: function(activity) {
            categoriesJSON.forEach(function(cat_str) {
              var category = new HeadOutdoors.Models.Category({
                label: cat_str
              });

              category.save({}, {
                success: function(category) {
                  // save success create link object
                  var categoryLink = new HeadOutdoors.Models.CategoryLink({
                    activity_id: activity.id,
                    category_id: category.id
                  });
                  debugger

                  categoryLink.save();
                }
              })
            });
            Backbone.history.navigate('#/activities/' + activity.id, {trigger: true})
          }
        });
      }
    });
  }
});
