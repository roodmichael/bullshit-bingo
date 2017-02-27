module Update exposing (..)

import Model exposing (initialModel)
import Model.Word exposing (Word)
import Model exposing (..)

type Msg 
    = NoOp
    | NewGame
    | Select Word

toggleSelected : List Word -> Word -> List Word
toggleSelected words word =
    let 
        toggle (listWord) =
            if listWord == word then
                { listWord | selected = not listWord.selected }
            else
                listWord
    in 
        List.map toggle words

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp -> 
            (model, Cmd.none)
        NewGame ->
            (initialModel, Cmd.none)
        Select word ->
            ({ model | data = toggleSelected model.data word}, Cmd.none)
