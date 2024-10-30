----------------- menu ------------------

menu :: IO ()

menu = do   putStr "Student's name: \n"
            name <- getLine
            putStr "Registration number: \n"
            registration <- getLine
            putStr "Student grade: \n"
            note <- getLine
            putStr "Student registration \n"
            putStrLn ("The name is " ++ name ++ 
                    "The enrollment is " ++ registration ++ 
                    "And the note is " ++ note)