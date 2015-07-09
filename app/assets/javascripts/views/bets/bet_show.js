BetIt.Views.BetShow = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  template: JST["bets/show"],

  render: function () {
    var content = this.template({ bet: this.model });
    this.$el.html(content);
    return this;
  }
});
