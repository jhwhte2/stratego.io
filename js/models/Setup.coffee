define (require) ->

    Backbone = require 'backbone'

    ranks = require '../ranks'

    class extends Backbone.Model

        defaults: ->
            board: [
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            ]

        setPiece: ({x, y}, piece) ->
            @get('board')[x][y] = piece

        getPiece: ({x, y}) ->
            @get('board')[x][y]

        initialize: ->
            pieces = []
            for pieceRank, pieceDetails of ranks
                for [1..pieceDetails.amount]
                    pieces.push rank: pieceRank, side: 3

            for i in [0..3]
                @get('board')[i] = pieces.splice(0, 10)