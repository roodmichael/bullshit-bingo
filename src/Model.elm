module Model exposing (..)

import Model.Ui exposing (Ui, initialUi)
import Model.Words exposing (Words, initialWords)

type alias Model = 
    { ui : Ui
    , words : Words
    }

initialModel : Model
initialModel = 
    { ui = initialUi
    , words = initialWords
    }
