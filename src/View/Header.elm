module View.Header exposing (titleView, optionsView)

import Html exposing (Html, section, div, h1, button, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Update exposing (..)

titleView : Html Msg 
titleView = 
    section
        []
        [div
            [ id "title"
            , class "titlecontainer"
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