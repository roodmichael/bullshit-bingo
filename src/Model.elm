module Model exposing (..)

import Model.Ui exposing (Ui, initialUi)
import Model.Data exposing (Data, initialData)

type alias Model = 
    { ui : Ui
    , data : Data
    }

initialModel : Model
initialModel = 
    { ui = initialUi
    , data = initialData
    }
