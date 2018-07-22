module Main exposing (..)

import Html exposing (Html, text, div, beginnerProgram, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


---- MODEL ----

type alias Model =
    List Int

---- UPDATE ----

type Msg
    = Increment Int



-- update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
      Increment index ->
        List.indexedMap
          (\i count ->
            if i == index then
              count + 1
              else
                count
            )
            model


---- VIEW ----

viewCount : Int -> Int -> Html Msg
viewCount index count =
  div [ class "mb-2" ]
      [ text (toString count)
      , button
          [ class "btn btn-primary", onClick (Increment index) ]
          [ text "+" ]
    ]

view : Model -> Html Msg
view model =
    div [ class "text-center" ]
        (List.indexedMap viewCount model)


---- PROGRAM ----


-- main : Program Never Model Msg
main =
    beginnerProgram
        { model = [0,0]
        , view = view
        , update = update
        }
