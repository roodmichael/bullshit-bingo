module Model.Data exposing (..)
import Model.Word exposing (Word, setWord)

type alias Data =
    ( List Word )

createInitialWord : String -> Word
createInitialWord word =
    setWord word False

getWordList : List String 
getWordList =
    ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]

initialData : Data
initialData =
    List.map createInitialWord getWordList
