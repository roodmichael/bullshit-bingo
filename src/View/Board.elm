module View.Board exposing (..)

import Html exposing (Html, section, div, text)
import Html.Attributes exposing (id, class)
import Html.Events exposing (onClick)

import Update exposing (..)
import Model.Word exposing (Word)
import Model.Bingo exposing (Bingo)

boardView : List Word -> Bingo -> Html Msg
boardView words bingo =
    section
        []
        [ div 
            [ class "bingocontainer" ]
            [ boardBingoView bingo ]
        , div 
            [ id "gameboard"
            , class "boardcontainer"
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
        [ class "tilecontainer"
        , class (boardTileClass word)
        , onClick (Select word)
        ]
        [ boardWordView word.word ]

boardWordView : String -> Html Msg
boardWordView word =
    div
        [ class "word"]
        [ text (toString word)]

boardBingoVisible : Bingo -> String 
boardBingoVisible isBingo =
    case isBingo of 
        True ->
            "visible"
        False ->
            "hidden"

boardBingoView : Bool -> Html Msg 
boardBingoView isBingo =
    div 
        [ class "bingocontainer"
        , class (boardBingoVisible isBingo)
        ]
        [ text "Bingo!" ]
