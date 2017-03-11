module View.Header exposing (titleView, optionsView)

import Html exposing (Html, section, div, h1, button, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Model.Bingo exposing (Bingo)

import Update exposing (..)

titleHighlight: Bingo -> String
titleHighlight isBingo =
    case isBingo of
        True ->
            "is-bingo"
        False ->
            ""

titleView : Bool -> Html Msg 
titleView isBingo = 
    section
        []
        [div
            [ id "title"
            , class "header-container"
            , class (titleHighlight isBingo)
            ]
            [ text "Bullshit Bingo!"
            ]
        ]

optionsView : Html Msg 
optionsView = 
    section
        [ id "options"
        , class "optionscontainer"
        ]
        [ button
            [onClick NewGame]
            [text "Start/Refresh"]
        ]