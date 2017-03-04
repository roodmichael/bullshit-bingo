module Model.Words exposing (..)
import Model.Word exposing (Word, setWord)

type alias Words =
    ( List Word )

createInitialWord : String -> Word
createInitialWord word =
    setWord word False

getWordList : List String 
getWordList =
    ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]

initialWords : Words
initialWords =
    List.map createInitialWord getWordList
