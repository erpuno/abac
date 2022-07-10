-ifndef(SUBJECTS_HRL).
-define(SUBJECTS_HRL, true).

-record(subject_employee, {
                         id = [] :: [] | list() | binary(),
                         roles = [] :: [] | list(atom()),
                         routing = [] :: [] | atom(),
                         substitute_type = [] :: [] | assistant | delegat,
                         status = [] :: [] | atom(),
                         org = [] :: [] | list(),
                         branch = [] :: [] | list()
                       }).
-endif.


