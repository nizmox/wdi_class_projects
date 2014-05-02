BlogAjax.Views.PostView = Backbone.View.extend({
  el: '#main',

  events: {
    'submit': 'addComment' 
  },
  addComment: function(event) {
    //prevent the standard form submit option
    event.preventDefault();

    var post_id = this.model.get('id');
    var text = $('#comment').val();
    var author = $('#author').val();
    
    var comment = new BlogAjax.Models.Comment({
      post_id: post_id,
      author: author,
      content: text
    });

    comment.save();
  },

  initialize: function () {
    this.template = _.template($('#postView').html());
    this.render();

    this.comments = new BlogAjax.Collections.Comments({post_id: this.model.get('id')});
    var view = this;
    this.comments.fetch().done(function () {
      // console.log(view.comments.models);
      view.comments.each(function (comment, index) {
        var commentView = new BlogAjax.Views.CommentView({model: comment});
        commentView.render();
      });
    });
  },
  render: function () {
    this.$el.html(this.template(this.model.toJSON()));
  }

});
