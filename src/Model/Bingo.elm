module Model.Bingo exposing (..)

import Model.Words exposing (Words)
import Model.Word exposing (Word)

import Array 
import Debug

type alias Bingo =
    (Bool)

initialBingo : Bingo
initialBingo =
    False

isTrue : Word -> Bool
isTrue word =
    word.selected == True

checkHorizontal : Words -> Bool
checkHorizontal words =
    let 
        array = Array.slice 0 4 (Array.fromList words)
        _ = Debug.log "Message" (toString ((Array.length (Array.filter isTrue array)) >= 4))
    in 
        Array.length (Array.filter isTrue array) >= 4 

checkVertical : Words -> Bool
checkVertical words = 
    False 

checkDiagonal : Words -> Bool
checkDiagonal words =
    False 

isBingo : Words -> Bool
isBingo words =
    checkHorizontal words