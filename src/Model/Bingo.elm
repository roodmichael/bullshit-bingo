module Model.Bingo exposing (..)

import Model.Words exposing (Words)
import Model.Word exposing (Word)

type alias Bingo =
    (Bool)

initialBingo : Bingo
initialBingo =
    False

isSelected : Word -> Int
isSelected word =
    case word.selected of 
        False ->
            0
        True ->
            1

countSelected : Words -> Int
countSelected words =
    case words of
        [] ->
            0
        word :: rest ->
              (isSelected word) + countSelected rest

hasBingo : Words -> Int -> Bool
hasBingo words base =
    countSelected words == base

checkRows : Words -> Int -> Bool
checkRows words width =
    let
      row = List.take width words
      rest = List.drop width words
    in
      case row of
        [] ->
            False
        default ->
            if (hasBingo row width) then
                True
            else
                checkRows rest width

pickColumn : Words -> Int -> Int -> Words
pickColumn words width column =
    let 
        row = List.take width words 
        rest = List.drop width words
        tile = List.take 1 (List.drop (column - 1) row)
    in
        case words of 
            [] -> []
            default ->
                List.concat [tile, pickColumn rest width column]

checkColumns : Words -> Int -> List Int -> Bool
checkColumns words height columns =
    case columns of 
        [] -> False 
        first :: rest ->
            let 
                column = pickColumn words height first
            in 
                if (hasBingo column height) then
                    True 
                else
                    checkColumns words height rest

checkDiagonals : Words -> Int -> List Int -> Bool
checkDiagonals words height columns =
    case columns of
        [] -> False 
        first :: rest ->
            False

isBingo : Words -> Bool
isBingo words =
    let
        base = truncate (sqrt (toFloat (List.length words)))
        columns = List.range 1 base
    in
        checkRows words base
        || checkColumns words base columns
    --|| checkDiagonal words