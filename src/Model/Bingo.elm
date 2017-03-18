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
    
checkDiagonal : Words -> Int -> List Word -> Bool
checkDiagonal words base list =
    let 
        tile = List.take 1 words
        rest = List.drop (base + 1) words
        diag = List.concat [list, tile]
    in 
        case rest of 
            [] ->
                if (hasBingo diag base) then
                    True
                else
                    False
            default ->
                checkDiagonal rest base diag

checkDiagonalReverse : Words -> Int -> Int -> List Word -> Bool
checkDiagonalReverse words base iterator list =
    let 
        throw = List.drop (base - iterator) words
        tile = List.take 1 throw
        rest = List.drop base words
        diag = List.concat [list, tile]
        nextiterator = iterator + 1
    in 
        case rest of 
            [] ->
                if (hasBingo diag base) then
                    True 
                else 
                    False
            default ->
                checkDiagonalReverse rest base nextiterator diag

isBingo : Words -> Bool
isBingo words =
    let
        base = truncate (sqrt (toFloat (List.length words)))
        columns = List.range 1 base
    in
        checkRows words base
        || checkColumns words base columns
        || checkDiagonal words base []
        || checkDiagonalReverse words base 1 []