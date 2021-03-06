define (require) ->

  template = require '../../jade/board.jade'

  class extends Backbone.View
    className:  'board-view image-board-no-trees'

    initialize: ->
      @$el.html template()

      @$contentContainer = @$el.find '.content-container'

    resize: (w, h, min) ->
      if w > h
        @$el
          # Horizontal align.
          .css 'left', '50%'
          .css 'margin-left', min/-2

          # Turn off vertical align.
          .css 'top', '0'
          .css 'margin-top', '0'

          # Put a border on the left and right, turn off border on top and bottom.
          .css 'border-left', '1px solid'
          .css 'border-right', '1px solid'
          .css 'border-top', '0'
          .css 'border-bottom', '0'
      else
        @$el
          # Vertical align.
          .css 'top', '50%'
          .css 'margin-top', min/-2

          # Turn off horizontal align.
          .css 'left', '0'
          .css 'margin-left', '0'

          # Put a border on the top and bottom, turn off border on left and right.
          .css 'border-top', '1px solid'
          .css 'border-bottom', '1px solid'
          .css 'border-left', '0'
          .css 'border-right', '0'

      @$el.css 'border-color', 'rgba(0, 0, 0, 0.2)'

      @$el
        .width min
        .height min
