import Html exposing (Html, Attribute, button, div, input, text)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- Model
type alias Model = 
  {
    content : String
  }

model =
  Model ""

-- View
view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to reverse", onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    ]

-- Update
type Msg =
  Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }