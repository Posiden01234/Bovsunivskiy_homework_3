-module(lesson3_task01).
-export([first_word/1]).

first_word(BinText) ->
    first_word(BinText, <<>>, false).

first_word(<<>>, Acc, true) -> 
    Acc;
first_word(<<>>, _Acc, false) -> 
    <<>>;
first_word(<<Char, Rest/binary>>, Acc, WordStarted) ->
    case is_word_char(Char) of
        true ->
            first_word(Rest, <<Acc/binary, Char>>, true);
        false when WordStarted == true ->
            Acc;
        false ->
            first_word(Rest, Acc, false)
    end.

is_word_char(Char) when Char >= $a, Char =< $z; 
                         Char >= $A, Char =< $Z; 
                         Char >= $0, Char =< $9 ->
    true;
is_word_char(_) ->
    false.
