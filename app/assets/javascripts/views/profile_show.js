HeadOutdoors.Views.ProfileShow = Backbone.CompositeView.extend({
  template: JST['profile_show'],

  className: 'profile-show-wrapper',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'submit form#registrationForm' : 'saveProfile'
  },

  render: function() {
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);
    this.attachSubviews();

    return this;
  },

  saveProfile: function(e) {
    e.preventDefault();
    var profileJSON = $(e.currentTarget).serializeJSON().user;
    var view = this;

    this.model.save(profileJSON, {
      success: function(savedUser) {
        Backbone.history.navigate('#/users/' + view.model.id, { trigger:true })
      },
      errors: function() {
        // TODO do something?
      }
    });
  }
});
