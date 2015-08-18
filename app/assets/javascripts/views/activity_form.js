HeadOutdoors.Views.ActivityForm = Backbone.CompositeView.extend({
  template: JST['activity_form'],

  initialize: function() {
    this.addAddressFormSubview();
    this.model = new HeadOutdoors.Models.Activity();
  },

  events: {
    "submit .activity-form" : "saveActivity",
    "click button.upload-image" : "uploadImage"
  },

  uploadImage: function(e) {
    e.preventDefault();
    var view = this;

    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result){
      var resized = result[0].eager[0];
      var original = result[0];
      debugger;
      view.model.set({
        "img_url": resized.url,
        "img_url_full_size": original.url
      })
    });
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
    var view = this;

    debugger
    // save address - on success save activity - on success navigate to activity
    var address = new HeadOutdoors.Models.Address(addressJSON);
    address.save({}, {
      success: function(address) {
        view.model.set({ address_id: address.id });
        view.model.set(activityJSON.activity);

        view.model.save({}, {
          success: function(activity) {
            categoriesJSON.forEach(function(cat_str) {
              var category = new HeadOutdoors.Models.Category({
                label: cat_str
              });

              category.save({}, {
                success: function(category) {
                  var categoryLink = new HeadOutdoors.Models.CategoryLink({
                    activity_id: activity.id,
                    category_id: category.id
                  });
                  categoryLink.save();
                }
              })
            });
            Backbone.history
              .navigate('#/activities/' + activity.id, {trigger: true})
          }
        });
      }
    });
  }
});
