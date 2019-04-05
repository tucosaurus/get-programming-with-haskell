import Data.List

ifEvenInc n = if even n
    then n + 1
    else n

ifEven fn x = if even x
    then fn x
    else x

inc n = n + 1
double n = n * 2
square n = n^2

ifEvenInc1 n = ifEven inc n
ifEvenDouble n = ifEven double n
ifEvenSquare n = ifEven square n

ifEvenCube n = ifEven (\x -> x^3) n

names = [("Ian", "Curtis"),
          ("Bernard","Sumner"),
          ("Peter", "Hook"),
          ("Stephen","Morris")]

compareLastNames name1 name2 = 
    if lastName1 > lastName2
    then GT
    else if lastName1 < lastName2
    then LT
    else EQ
    where lastName1 = snd name1
          lastName2 = snd name2

compareLastNames1 name1 name2 = 
    if lastName1 > lastName2
    then GT
    else if lastName1 < lastName2
    then LT
    else if firstName1 > firstName2
        then GT
        else if firstName1 < firstName2
            then LT
            else EQ
    where lastName1 = snd name1
          lastName2 = snd name2
          firstName1 = fst name1
          firstName2 = fst name2


compareLastNames name1 name2 =
    if result == EQ
    then compare (fst name1) (fst name2)
    else EQ
    where result = compare (snd name1) (snd name2)


comparseLastNamesLet name1 name2 =
    let result = compare (snd name1) (snd name2)
    if result == EQ
        then compare (fst name1) (fst name2)
        else EQ


counter x = let a = x + 1
            in
                let b = x + 1
                in
                    x

counterLambda x = (\b -> b + 1)((\a -> a + 1)x)