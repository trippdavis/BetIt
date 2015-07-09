BetIt.Views.BetsIndex = Backbone.View.extend ({
  initialize: function() {

    this.listenTo(this.collection, "sync", this.render);
  },

  template: JST['bets/index'],

  render: function () {
    var content = this.template({ bets: this.collection });
    this.$el.html(content);
    return this;
  }
});
