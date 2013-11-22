module Main where
    tryIO = do  putStr "Enter Your Name : " ;
                line <- getLine;
                let { backwards = reverse line } ;
                return ("Hello " ++ line ++ ", your name backwards is " ++ backwards )
