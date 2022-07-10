-module(abac).
-compile(export_all).
-include("abac.hrl").
-include("request.hrl").
-include("objects.hrl").
-include("subjects.hrl").
-include_lib("kvs/include/metainfo.hrl").
-include_lib("kvs/include/kvs.hrl").
-behaviour(application).
-behaviour(supervisor).
-export([start/2, stop/1, init/1]).

start(_StartType, _StartArgs) ->
   kvs:join([], #kvs{mod = kvs_rocks, db = "rocksdb"}),
   kvs:join([], #kvs{mod = kvs_rocks, db = "stat"}),
   kvs:join([], #kvs{mod = kvs_mnesia}),
   erp:boot(),
   supervisor:start_link({local, ?MODULE}, ?MODULE, []).
stop(_State) -> ok.
init([]) -> {ok, { {one_for_one, 5, 10}, []} }.

metainfo() -> #schema { name = crm,  tables = tables() }.
tables() -> [
              #table  { name = rule, fields = record_info(fields, rule), instance = #rule{}, keys = record_info(fields, rule)},
              #table  { name = policy, fields = record_info(fields, policy), instance = #policy{}, keys = record_info(fields, policy)},
              #table  { name = rule_ref, fields = record_info(fields, rule_ref), instance = #rule_ref{} },
              #table  { name = object_process, fields = record_info(fields, object_process), instance = #object_process{} },
              #table  { name = object_file, fields = record_info(fields, object_file), instance = #object_file{}},
              #table  { name = object_form, fields = record_info(fields, object_form), instance = #object_form{}},
              #table  { name = object_corr, fields = record_info(fields, object_corr), instance = #object_corr{}},
              #table  { name = object_email, fields = record_info(fields, object_email), instance = #object_email{}},
              #table  { name = object_employee, fields = record_info(fields, object_employee), instance = #object_employee{}}
              #table  { name = request, fields = record_info(fields, request), instance = #request{}},
              #table  { name = context, fields = record_info(fields, context), instance = #context{}},
              #table  { name = subject_employee, fields = record_info(fields, subject_employee), instance = #subject_employee{}}
            ].
