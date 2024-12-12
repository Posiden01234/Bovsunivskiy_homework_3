-module(lesson3_task3).
-export([split/2]).

split(BinText, Delimiter) when is_binary(BinText), is_binary(Delimiter) ->
    split_helper(BinText, Delimiter, [], []).

split_helper(<<>>, _Delimiter, PartAcc, Parts) ->
    lists:reverse([list_to_binary(lists:reverse(PartAcc)) | Parts]);
split_helper(BinText, Delimiter, PartAcc, Parts) ->
    DelimiterSize = erlang:byte_size(Delimiter),
    case BinText of
        <<Delimiter:DelimiterSize/binary, Rest/binary>> ->
            split_helper(Rest, Delimiter, [], [list_to_binary(lists:reverse(PartAcc)) | Parts]);
        <<Char, Rest/binary>> ->
            split_helper(Rest, Delimiter, [Char | PartAcc], Parts)
    end.