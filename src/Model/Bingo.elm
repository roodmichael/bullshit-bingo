module Model.Bingo exposing (..)

import Model.Words exposing (Words)
import Model.Word exposing (Word)

import Array

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
        wordsArray = Array.fromList words
        row1 = Array.slice 0 4 wordsArray
        row2 = Array.slice 4 8 wordsArray
        row3 = Array.slice 8 12 wordsArray
        row4 = Array.slice 12 16 wordsArray
    in 
        (Array.length (Array.filter isTrue row1)) >= 4
        || (Array.length (Array.filter isTrue row2)) >= 4
        || (Array.length (Array.filter isTrue row3)) >= 4
        || (Array.length (Array.filter isTrue row4)) >= 4

concat : Array.Array Word -> Array.Array Word-> Array.Array Word
concat input output = 
    case output of 
        xs ->
            Array.append input output


checkVertical : Words -> Bool
checkVertical words =
    let 
        wordsArray = Array.fromList words
        col1 = concat (Array.slice 0 1 wordsArray) (Array.slice 4 5 wordsArray)
             |> concat (Array.slice 8 9 wordsArray)
             |> concat (Array.slice 12 13 wordsArray)
        col2 = concat (Array.slice 1 2 wordsArray) (Array.slice 5 6 wordsArray)
             |> concat (Array.slice 9 10 wordsArray)
             |> concat (Array.slice 13 14 wordsArray)
        col3 = concat (Array.slice 2 3 wordsArray) (Array.slice 6 7 wordsArray)
             |> concat (Array.slice 10 11 wordsArray)
             |> concat (Array.slice 14 15 wordsArray)
        col4 = concat (Array.slice 3 4 wordsArray) (Array.slice 7 8 wordsArray)
             |> concat (Array.slice 11 12 wordsArray)
             |> concat (Array.slice 15 16 wordsArray)
    in 
        Array.length (Array.filter isTrue col1) >= 4
        || Array.length (Array.filter isTrue col2) >= 4
        || Array.length (Array.filter isTrue col3) >= 4
        || Array.length (Array.filter isTrue col4) >= 4

checkDiagonal : Words -> Bool
checkDiagonal words =
    let
        wordsArray = Array.fromList words
        diag1 = concat (Array.slice 0 1 wordsArray) (Array.slice 5 6 wordsArray)
             |> concat (Array.slice 10 11 wordsArray)
             |> concat (Array.slice 15 16 wordsArray)
        diag2 = concat (Array.slice 3 4 wordsArray) (Array.slice 6 7 wordsArray)
             |> concat (Array.slice 9 10 wordsArray)
             |> concat (Array.slice 12 13 wordsArray)
        _ = Debug.log "Message" (toString diag1)
    in
        Array.length (Array.filter isTrue diag1) >= 4
        || Array.length (Array.filter isTrue diag2) >= 4

isBingo : Words -> Bool
isBingo words =
    checkHorizontal words
    || checkVertical words
    || checkDiagonal words