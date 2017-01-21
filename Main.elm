module MainWindowExample exposing (..)

import Html exposing (Html)
import WindowExample exposing (..)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
