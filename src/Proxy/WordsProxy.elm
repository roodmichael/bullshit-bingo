module Proxy.WordsProxy exposing (..)

-- this should retrieve words from an api. For now it is
-- just returning 16 words for a 4x4 grid
getWords: Int -> List String
getWords numWords =
    ["Alignment","Empower","Lean In","Mechanism"
    ,"Agile","Cloud","Convergence","Bandwidth"
    ,"Immersive","ROI","Big Data","Synergy"
    ,"Pivot","Value-add","Leverage","Silos"]