module Main exposing (main)

import Browser
import Css exposing (..)
import Html.Styled exposing (Html, div, h1, img, text)
import Html.Styled.Attributes exposing (css, id, src)
import Time exposing (Posix)



---- MODEL ----


type alias Model =
    { currentTime : Posix
    }


init : ( Model, Cmd Msg )
init =
    ( { currentTime = Time.millisToPosix 0 }, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | CurrentTime Posix


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CurrentTime posix ->
            ( { model | currentTime = posix }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , pdfViewer model.currentTime
        ]


pdfViewer : Posix -> Html Msg
pdfViewer time =
    div []
        [ h1 [] [ text <| "Current time is " ++ (String.fromInt <| Time.posixToMillis time) ]
        , div
            [ id "viewer"
            , css [ height (px 600), overflow hidden ]
            ]
            []
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view >> Html.Styled.toUnstyled
        , init = \_ -> init
        , update = update
        , subscriptions = \_ -> Time.every 1000 CurrentTime
        }
