module WindowExample
    exposing
        ( init
        , update
        , view
        , subscriptions
        )

{-|
This is a convenient spot to hold
values useful for the layout of the panes, etc.

The values are held here as well as functions
that calculate locating the different components of
    the game.
-}

import Window
import Task
import Html exposing (Html, div, text)
import Html.App


type alias Model =
    { windowSize : Window.Size
    }


init : ( Model, Cmd Msg )
init =
    ( { windowSize =
            Window.Size 0 0
      }
    , Task.perform (\_ -> Idle) (\x -> Resize x) Window.size
    )


type Msg
    = Resize Window.Size
    | Idle


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Resize newSize ->
            ( { model
                | windowSize = newSize
              }
            , Cmd.none
            )

        Idle ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Window.resizes Resize


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ text
                ("Width: "
                    ++ toString model.windowSize.width
                )
            ]
        , div []
            [ text
                ("Height: "
                    ++ toString model.windowSize.height
                )
            ]
        ]
