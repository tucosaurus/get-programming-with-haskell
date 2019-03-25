toPart recipient = "Dear " ++ recipient ++ ",\n"

bodyPart title = "Thanks for buying " ++ title ++ "\n"

fromPart author = "Thanks " ++ author

createEmail recipient title author = toPart recipient ++
                                      bodyPart title ++
                                      fromPart author

main = do
    print "Who is the email for?"
    recipient <- getLine
    print "What is the Title?"
    title <- getLine
    print "Who is the Author?"
    author <- getLine
    -- The function returned a string (a value)
    -- instead of printing the string
    -- side effect free function
    print (createEmail recipient title author)