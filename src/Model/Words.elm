module Model.Words exposing (..)
import Model.Word exposing (Word, setWord)

type alias Words =
    ( List Word )

createWord : String -> Word
createWord word =
    setWord word False

getWordList : List String 
getWordList =
    ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]

newWords : Words
newWords =
    List.map createWord getWordList

initialWords : Words
initialWords =
    []
