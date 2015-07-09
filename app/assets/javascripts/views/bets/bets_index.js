BetIt.Views.BetsIndex = Backbone.View.extend ({
  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  template: JST['bets/index'],

  events: {
    "click .bets-index-item": "showBet"
  },

  render: function () {
    var content = this.template({ bets: this.collection });
    this.$el.html(content);
    return this;
  },

  showBet: function (event) {
    var betId = $(event.target).data("id");
    Backbone.history.navigate("bets/" + betId, { trigger: true });
  }
});
