NewsReader.Views.FeedListItem = Backbone.View.extend({
  template: JST["feed_list_item"],
  tagName: 'li',
  events: {
    'click button.delete': 'delete'
  },

  render: function () {
    var content = this.template({ feed: this.model });
    this.$el.html(content);
    return this;
  },

  delete: function (event) {
    this.model.destroy();
    this.remove();
  }

});
