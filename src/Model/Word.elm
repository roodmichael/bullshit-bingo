module Model.Word exposing (Word, setWord)

type alias Word =
    { word: String
    , selected: Bool
    }

setWord : String -> Bool -> Word 
setWord word selected =
    { word = word 
    , selected = selected
    }