module View.Board exposing (..)

import Html exposing (Html, section, div, text)
import Html.Attributes exposing (id, class)
import Html.Events exposing (onClick)

import Update exposing (..)
import Model.Word exposing (Word)

boardView : List Word -> Html Msg
boardView words =
    section
        []
        [ div 
            [ id "gameboard"
            , class "board-container"
            ]
            (List.map boardTileView words)
        ]

boardTileClass : Word -> String
boardTileClass word =
    case word.selected of
        True ->
            "selected"
        False ->
            ""

boardTileView : Word -> Html Msg 
boardTileView word =
    div 
        [ class "tile-container"
        , class (boardTileClass word)
        , onClick (Select word)
        ]
        [ boardWordView word.word ]

boardWordView : String -> Html Msg
boardWordView word =
    div
        [ class "word"]
        [ text word]
