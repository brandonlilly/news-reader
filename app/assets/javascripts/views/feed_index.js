NewsReader.Views.FeedIndex = Backbone.View.extend({
  template: JST["feed_index"],

  events: {
  },

  initialize: function () {
    this.listenTo(this.collection, 'sync remove add', this.render);
  },

  render: function(){
    var content = this.template({ feeds: this.collection });
    this.$el.html(content);

    var form = new NewsReader.Views.FeedForm({ collection: this.collection });
    this.$el.append(form.render().$el)

    this.$('ul').empty();
    this.collection.forEach(function(feed) {
      var view = new NewsReader.Views.FeedListItem({ model: feed });
      this.$('ul').append(view.render().$el);
    }.bind(this));

    return this;
  }
});
