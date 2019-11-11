-- Type Synonyms

type FirstName = String
type LastName = String
type Age = Int
type Height = Int

-- type Patient = (FirstName, LastName, Age, Height) 

-- patientInfo :: FirstName -> LastName -> Age -> Height -> String

-- patientInfo patient = name ++ " " ++ ageHeight
--     where name = patient.LastName ++ ", " ++ patient.FirstName
--           ageHeight = "( " ++ show patient.Age ++ " )"

type PatientName = (String, String)

firstName :: PatientName -> String
firstName patient = fst patient

lastName :: PatientName -> String
lastName patient = snd patient


-- Creating our own types using data keyword

data Sex = Male | Female

sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

showSex :: Sex -> String
showSex Male = "Male"
showSex Female = "Female"


data RhType = Pos | Neg

data ABOType = A | B | AB | O

data BloodType = BloodType ABOType RhType

patient1BT :: BloodType
patient1BT = BloodType A Pos

patient2BT :: BloodType
patient2BT = BloodType O Neg

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"

showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"

showBloodType :: BloodType -> String
showBloodType (BloodType abo rh) = showABO abo ++ showRh rh

canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _ ) _ = True
canDonateTo _ (BloodType AB _) = True
canDonateTo (BloodType A _) (BloodType A _) = True
canDonateTo (BloodType B _) (BloodType B _) = True
canDonateTo _ _ = False

-------------

-- Type Synonyms
type MiddleName = String

-- Our custom type
data Name = Name FirstName LastName 
        | NameWithMiddle FirstName MiddleName LastName

showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName (NameWithMiddle f m l) = f ++ " " ++ m ++ " " ++ l

name1 = Name "Jerome" "Salinger"
name2 = NameWithMiddle "Jerome" "David" "Salinger"

-------------
-- data Patient = Patient Name Sex Int Int Int BloodType

-- johnDoe :: Patient
-- johnDoe = Patient (Name "John" "D") Male 30 34 200 (BloodType AB Pos)

-- getName :: Patient -> Name
-- getName (Patient n _ _ _ _ _) = n

-- getAge :: Patient -> Int
-- getAge (Patient _ _ a _ _ _) = a

-- getBloodType :: Patient -> BloodType
-- getBloodType (Patient _ _ _ _ _ bt) = bt

-- Haskell Record Syntax
data Patient = Patient { name :: Name
                        , sex :: Sex
                        , age :: Int
                        , height :: Int
                        , weight :: Int
                        , bloodType :: BloodType }

jackieSmith :: Patient
jackieSmith = Patient { name = NameWithMiddle "Jackie" "a" "Smith"
                    , age = 43
                    , sex = Female
                    , height = 62
                    , weight = 112
                    , bloodType = BloodType O Neg}

-- all fields in record syntax get their own getters and setters
-- height jackieSmith

-- Exercises:
-- Q12.1
-- Write a function similar to canDonateTo that takes two patients as arguments rather than two BloodTypes

canDonateToWithPatient :: Patient -> Patient -> Bool
canDonateToWithPatient p1 p2 = 
    canDonateTo (bloodType p1) (bloodType p2)


-- Q12.2
-- Implement a patientSummary function that uses your final Patient type. patient- Summary should output a string that looks like this:
-- **************
--  Patient Name: Smith, John
--  Sex: Male
--  Age: 46
--  Height: 72 in.
--  Weight: 210 lbs.
--  Blood Type: AB+
--  **************

-- patientSummary :: Patient -> String
patientSummary p1 = "********" ++
                "Patient Name: " ++ (showName (name p1)) ++
                "Sex: " ++ (showSex (sex p1)) ++
                "Age: " ++ (show (age p1)) ++
                "Height: " ++ (show (height p1)) ++ 
                "Weight: " ++ (show (weight p1)) ++
                "Blood Type: " ++ (showBloodType (bloodType p1) )
                ++ "*********"