import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
  Html.beginnerProgram { model = model, view = view, update = update}

-- Model
type alias Model = 
  {
    name : String,
    password : String,
    passwordAgain : String
  }

model : Model
model =
  Model "" "" ""

-- View
view : Model -> Html Msg
view model =
  div []
    [ input [ type' "text", placeholder "Text", onInput Name ] []
    , input [ type' "password", placeholder "password", onInput Password ] []
    , input [ type' "password", placeholder "password again", onInput PasswordAgain ] []
    , viewValidation model
    ]

viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if model.password == model.passwordAgain then
        ("green", "Nice password")
      else
        ("red", "THESE ARE NOT THE SAME")
  in
    div [ style [("color", color)] ] [ text message ]

-- Update
type Msg 
  = Name String 
  | Password String
  | PasswordAgain String

update : Msg -> Model -> Model
update action model =
  case action of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }