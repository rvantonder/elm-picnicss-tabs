module Main exposing (Msg(..), main, update, view)

import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events


type alias Flags =
    {}


type alias Model =
    { tab : Int
    }


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { tab = 1 }, Cmd.none )


type Msg
    = Tab Int


update msg model =
    case msg of
        Tab 1 ->
            ( { model | tab = 1 }, Cmd.none )

        Tab 2 ->
            ( { model | tab = 2 }, Cmd.none )

        Tab _ ->
            ( model, Cmd.none )


view model =
    Html.Styled.toUnstyled <|
        div []
            [ div
                [ classList [ ( "row", True ) ] ]
                [ div
                    [ classList [ ( "tabs two", True ) ]
                    , css [ textAlign center ]
                    ]
                    [ input [ id "tabC-1", type_ "radio", name "tabgroupC", Html.Styled.Attributes.checked (model.tab == 1) ] []
                    , label [ class "pseudo button", Html.Styled.Attributes.for "tabC-1", Html.Styled.Events.onClick (Tab 1) ] [ text "1" ]
                    , input [ id "tabC-2", type_ "radio", name "tabgroupC", Html.Styled.Attributes.checked (model.tab == 2) ] []
                    , label [ class "pseudo button", Html.Styled.Attributes.for "tabC-2", Html.Styled.Events.onClick (Tab 2) ] [ text "2" ]
                    , div [ classList [ ( "row", True ) ], css [ textAlign center ] ]
                        [ div [] [ text "hello" ]
                        , div [] [ text "general kenobi" ]
                        ]
                    ]
                ]
            ]
