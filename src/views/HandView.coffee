class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    score = @collection.scores()[1]
    # console.log(@collection.scores())
    # console.log("hand: ", @collection.scores())
    score = @collection.scores()[0] if @collection.scores()[3] >= 21
    @$('.score').text @collection.bust(score)

