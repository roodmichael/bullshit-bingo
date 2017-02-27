module View.Board exposing (..)

import Html exposing (Html, section, div, text)
import Html.Attributes exposing (id, class)
import Html.Events exposing (onClick)

import Update exposing (..)
import Model.Word exposing (Word)

boardView : Int -> List Word -> Html Msg
boardView size words =
    section
        [ id "gameboard"
        , class "boardcontainer"
        ]
        [ boardRowView size words ]

boardRowView : Int -> List Word -> Html Msg 
boardRowView size words = 
    div 
        [ class "rowcontainer" ]
        (List.map boardWordView words)

boardWordView : Word -> Html Msg 
boardWordView word = 
    div 
        [ class "tilecontainer"
        , onClick (Select word)
        ]
        [ text (toString word)]
