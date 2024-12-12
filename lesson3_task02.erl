-module(lesson3_task02).
-export([words/1]).

words(BinText) ->
    words(BinText, <<>>, []).

words(<<>>, Acc, Words) -> 
    case Acc of
        <<>> -> lists:reverse(Words);
        _ -> lists:reverse([Acc | Words])
    end;
words(<<32, Rest/binary>>, Acc, Words) -> 
    case Acc of
        <<>> -> 
            words(Rest, <<>>, Words);
        _ -> 
            words(Rest, <<>>, [Acc | Words])
    end;
words(<<Char, Rest/binary>>, Acc, Words) ->
    words(Rest, <<Acc/binary, Char>>, Words).