import Html exposing (Html, Attribute, button, div, input, text, table)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String

-- Init
init : (Model, Cmd Msg)
init =
  (Model 1, Cmd.none)

-- Model
type alias Model =
  { number : Int
  , char : Char
  , players : Array
  }

-- View
View : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text (toString model.number) ]
    , button [ onClick NextNumber ] [ text "Next" ]
    ]

-- Update
type Msg = NextNumber

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NextNumber ->
      (model, Cmd.none) 

-- Subscriptions

