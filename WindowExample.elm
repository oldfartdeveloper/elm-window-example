module WindowExample
    exposing
        ( init
        , update
        , view
        , subscriptions
        )

import Window
import Task
import Html exposing (Html, div, text)


type alias Model =
    { windowSize : Window.Size
    }


init : ( Model, Cmd Msg )
init =
    ( { windowSize =
            Window.Size 0 0
      }
    , Task.perform Resize Window.size -- update size for initial display
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
