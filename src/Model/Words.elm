module Model.Words exposing (..)

import Model.Word exposing (Word, setWord)
import Proxy.WordsProxy exposing (getWords)

import Random
import List
import Tuple exposing (first, second)

type alias Words =
    ( List Word )

createWord : String -> Word
createWord word =
    setWord word False

shuffleWordList : List String -> List String
shuffleWordList words =
    let
        rand = Random.int 0 100
        seed = Random.initialSeed 12345
        rlist = Random.step (Random.list (List.length words) rand) seed |> first
        zipped = List.map2 (,) rlist words
        sorted = zipped |> List.sortBy first
        final = List.unzip sorted |> second
    in
        final

getWordList : List String 
getWordList =
    shuffleWordList (getWords 16)

newWords : Words
newWords =
    List.map createWord getWordList

initialWords : Words
initialWords =
    newWords
