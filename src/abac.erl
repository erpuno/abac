-module(abac).
-compile(export_all).
-include_lib("abac/include/acid.hrl").
-include_lib("form/include/meta.hrl").
-behaviour(application).
-behaviour(supervisor).
-export([start/2, stop/1, init/1]).

start(_StartType, _StartArgs) -> supervisor:start_link({local, ?MODULE}, ?MODULE, []).
stop(_State) -> ok.
init([]) -> {ok, { {one_for_one, 5, 10}, []} }.

find_rule([], _, _, _, _) -> [];
find_rule([H | T], S, A, Ot, O) ->
  case H of
    #acid{subject=S,api_endpoint=A,object_type=Ot,object=O} -> H;
    _ -> find_rule(T, S, A, Ot, O)
  end.

is_access_denied(Rules, Subject, Api_endpoint, Object_type, Object) ->
  case find_rule(Rules, Subject, Api_endpoint, Object_type, Object) of
    #acid{type = "deny"} -> true;
    _ -> false
  end.

is_access_confirmed(Rules, Subject, Api_endpoint, Object_type, Object) ->
 not is_access_denied(Rules, Subject, Api_endpoint, Object_type, Object).

get_doc_fields(create, #document{fields=Doc_fields}) -> get_doc_fields([], Doc_fields);
get_doc_fields(R, [#field{required=false} = H | T]) -> get_doc_fields(R ++ H, T);
get_doc_fields(R, [#field{required=true} | T]) -> get_doc_fields(R, T);
get_doc_fields(R, []) -> R;
get_doc_fields(_, #document{fields=Doc_fields}) -> Doc_fields.

limited_fields(Fs, F, A) -> limited_fields(Fs, F, A, []).
limited_fields(Fs, [#field{id=Id} = H | T], "auth" = A, R) ->
  case lists:member(Id, Fs) of
    true -> limited_fields(Fs, T, A, R);
    false -> limited_fields(Fs, T, A, R ++ H)
  end;
limited_fields(Fs, [#field{id=Id} = H | T], "deny" = A, R) ->
  case lists:member(Id, Fs) of
    false -> limited_fields(Fs, T, A, R);
    true -> limited_fields(Fs, T, A, R ++ H)
  end;
limited_fields(_, [], _, R) -> R.

select_doc_fields(Rules, Subject, Api_endpoint, Object, Document) ->
  case is_access_confirmed(Rules, Subject, Api_endpoint, "doc", Object) of
    true ->
      Rule = find_rule(Rules, Subject, Api_endpoint, "doc", Object),
      case Rule of
        [] -> Document;
        #acid{type=Auth_type,field_spec=R} ->
         Doc_fields = get_doc_fields(Api_endpoint, Document),
         Document#document{fields=limited_fields(R, Doc_fields, Auth_type)}
      end;
    false -> []
  end.
