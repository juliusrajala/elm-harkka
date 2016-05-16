import Html exposing (Html, Attribute, h1, button, div, input, text, table)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String
import Random

-- Main
main =
  Html.program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }

-- Init
init : (Model, Cmd Msg)
init =
  (Model 2 4, Cmd.none)

-- Model
type alias Model =
  { number : Int
  , numberTwo : Int
  }

-- View
view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text (toString model.number) ]
    , h1 [] [ text (toString model.numberTwo) ]
    , button [ onClick NextNumber ] [ text "Next" ]
    ]

-- Update
type Msg 
  = NextNumber
  | NewFace Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NextNumber ->
      (model, Random.generate NewFace (Random.int 1 32))

    NewFace newFace ->
      (Model newFace, Cmd.none)

-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
