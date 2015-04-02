NewsReader.Views.FeedShow = Backbone.View.extend({
  template: JST["feed_show"],

  events: {
    'click button': 'refresh'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function(){
    var content = this.template({ feed: this.model });
    this.$el.html(content);
    this.$('ul').empty();

    this.model.entries().forEach(function(entry) {
      var view = new NewsReader.Views.EntryListItem({ model: entry });
      this.$('ul').append(view.render().$el);
    }.bind(this));

    return this;
  },

  refresh: function () {
    this.model.fetch();
  }

});
