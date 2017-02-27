module Main exposing (..)

import Html exposing (Html) 
import Model exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)

main : Program Never Model Update.Msg
main = 
    Html.program 
    { init = (initialModel, Cmd.none)
    , update = update
    , view = view 
    , subscriptions = \_ -> Sub.none
    }
