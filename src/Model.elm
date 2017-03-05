module Model exposing (..)

import Model.Ui exposing (Ui, initialUi)
import Model.Words exposing (Words, initialWords)
import Model.Bingo exposing (Bingo, initialBingo)

type alias Model = 
    { ui : Ui
    , words : Words
    , bingo : Bingo
    }

initialModel : Model
initialModel = 
    { ui = initialUi
    , words = initialWords
    , bingo = initialBingo
    }
