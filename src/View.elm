module View exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (id, class)

import Model exposing (..)
import Update exposing (..)
import View.Header exposing (titleView, optionsView)
import View.Board exposing (boardView)

view : Model -> Html Msg 
view model =
    div
        [ id "appcontainer"
        , class "container"
        ]
        [ optionsView
        , titleView
        , boardView model.words
        ]
