-module(abac_boot).
-export([boot/0, policy/1]).
-include("abac.hrl").
-include("request.hrl").
-include("objects.hrl").
-include("subjects.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("bpe/include/bpe.hrl").

policy(Default) -> [

 % ---------------------- CREATE -----------------------------

  #policy{
    api_endpoint = create,
    combining    = all,
    object       = #object_form{id = rightsDelegation},
    rules        = [
      #rule{
        api_endpoint      = create,
        subject           = #subject_employee{roles = [register, executor, head], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = rightsDelegation, fields = [delegateTo, startTime, endTime, tempDutiesPerform]}
      }
    ]
  },

  #policy{
    api_endpoint = create,
    combining    = all,
    object       = #object_form{id = assistant},
    rules        = [
      #rule{
        api_endpoint      = create,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = assistant, fields = [head, assistants, startTime, endTime]}
      }
    ]
  },

  #policy{
    api_endpoint = create,
    combining    = all,
    object       = #object_form{id = inputOrder},
    rules        = [
      #rule{
        api_endpoint      = create,
        subject           = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = inputOrder, fields = [urgent, document_type, nomenclature, category, corr, topic, coordination, content, to, signed, number_out, date_out, note, dueDate, dueDateTime, main_sheets, add_sheets, device]}
      }
    ]
  },
  #policy{
    api_endpoint = create,
    combining    = all,
    object       = #object_form{id = esqInquire},
    rules        = [
      #rule{
        api_endpoint      = create,
        subject           = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = esqInquire, fields = [urgent, document_type, nomenclature, surname, name, patronymic, lawCertificate, authorityOrderNumber, category, corr, number_out, note, email, phone_number, koatuu_region, koatuu_place, form, address, house, surname_form, name_form, patronymic_form, dueDate, to, content, main_sheets, add_sheets, topic, coordination]}
      }
    ]
  },
  #policy{
    api_endpoint = create,
    combining    = all,
    object       = #object_form{id = adminService},
    rules        = [
      #rule{
        api_endpoint      = create,
        subject           = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = adminService, fields = [urgent, document_type, nomenclature, category, corr, number_out, date_out, topic, coordination, content, to, note, dueDate, dueDateTime, main_sheets, add_sheets]}
      }
    ]
  },
  #policy{
    api_endpoint = create,
    combining    = all,
    object       = #object_form{id = citizenInquire},
    rules        = [
      #rule{
        api_endpoint      = create,
        subject           = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = citizenInquire, fields = [document_type, nomenclature, date, surname, name, patronymic, gender, email, phone_number, subject, subject_count, author_type, social_status, address, house, content, issue, issue_type, issue_specie, form, averment, from, number_out, date_out, note, to, dueDate, result, main_sheets, add_sheets, topic, coordination]}
      }
    ]
  },
  #policy{
    api_endpoint = create,
    combining    = all,
    object       = #object_form{id = publicInquire},
    rules        = [
      #rule{
        api_endpoint      = create,
        subject           = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = publicInquire, fields = [document_type, nomenclature, subject, subject_number, subjects, author_type, social_status, surname, name, patronymic, gender, category, corr, email, phone_number, address, house, content, issue, issue_type, form, averment, from, number_out, date_out, note, to, dueDate, main_sheets, add_sheets, topic, coordination]}
      }
    ]
  },
  #policy{
    api_endpoint = create,
    combining    = all,
    object       = #object_form{id = deputyInquire},
    rules        = [
      #rule{
        api_endpoint      = create,
        subject           = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = deputyInquire, fields = [urgent, document_type, nomenclature,  number_out, date_out, note, request, committee, deputy, id_ndu, date_ndu, address_ndu, house, content, deputy_topic, category, corr, corr_from, surname, name, patronymic, email, phone_number, koatuu_region, koatuu_place, address, from, dueDate, to, main_sheets, add_sheets, topic, coordination]}
      }
    ]
  },
  #policy{
    api_endpoint = create,
    combining    = all,
    object       = #object_form{id = outputOrder},
    rules        = [
      #rule{
        api_endpoint      = create,
        subject           = #subject_employee{roles = [executor, head], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = outputOrder, fields = [urgent, document_type, nomenclature, corr, purpose, deputy, branch, head, executor, content, note, approvers, signatory, template]}
      }
    ]
  },
  #policy{
    api_endpoint = create,
    combining    = all,
    object       = #object_form{id = internalDoc},
    rules        = [
      #rule{
        api_endpoint      = create,
        subject           = #subject_employee{roles = [executor, head], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = internalDoc, fields = [urgent, document_type, nomenclature, note, branch, head, executor, content, approvers, signatory, target, template]}
      }
    ]
  },
  #policy{
    api_endpoint = create,
    combining    = all,
    object       = #object_form{id = orgDoc},
    rules        = [
      #rule{
        api_endpoint      = create,
        subject           = #subject_employee{roles = [executor, head], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = orgDoc, fields = [urgent, document_type, nomenclature, executor, branch, head, content, signatory, target, approvers, target_notify, dueDate, canceled, cancelDate, editDate, note, template]}
      }
    ]
  },

% ---------------------- CREATECHILD -----------------------------

  #policy{
    api_endpoint = createChild,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"},
    rules        = [
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [to], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = bizTask, fields = [point, content, executor, subexecutors, progress, dueDate, dueDate_subexecutors, control, control_by, priority, notify]}
      }
    ]
  },

  #policy{
    api_endpoint = createChild,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [], status = [uncomplete], routing = [executor, subexecutors, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object_condition = form_check,
        values = fields,
        object = #object_form{id = outputOrder, fields = [urgent, document_type, nomenclature, corr, purpose, deputy, branch, head, executor, content, note, approvers, signatory, template]}
      },
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [], status = [uncomplete], routing = [executor, subexecutors, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object_condition = form_check,
        values = fields,
        object = #object_form{id = orgDoc, fields = [urgent, document_type, nomenclature, executor, branch, head, content, signatory, target, target_notify, dueDate, canceled, cancelDate, editDate, note, template]}
      },
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [], status = [uncomplete], routing = [executor, subexecutors, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object_condition = form_check,
        values = fields,
        object = #object_form{id = internalDoc, fields = [urgent, document_type, nomenclature, note, branch, head, executor, content, approvers, signatory, target, template]}
      },
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor, subexecutors, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = bizTask, fields = [point, content, executor, subexecutors, progress, dueDate, dueDate_subexecutors, control, control_by, priority, notify]}
      }
    ]
  },

  #policy{
    api_endpoint = createChild,
    combining    = any,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [], status = [uncomplete], routing = [executor, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object_condition = form_check,
        values = fields,
        object = #object_form{id = outputOrder, fields = [urgent, document_type, nomenclature, corr, purpose, deputy, branch, head, executor, content, note, approvers, signatory, template]}
      },
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [], status = [uncomplete], routing = [executor, subexecutors, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object_condition = form_check,
        values = fields,
        object = #object_form{id = orgDoc, fields = [urgent, document_type, nomenclature, executor, branch, head, content, signatory, target, target_notify, dueDate, canceled, cancelDate, editDate, note, template]}
      },
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [], status = [uncomplete], routing = [executor, subexecutors, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object_condition = form_check,
        values = fields,
        object = #object_form{id = internalDoc, fields = [urgent, document_type, nomenclature, note, branch, head, executor, content, approvers, signatory, target, template]}
      },
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor, subexecutors, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = bizTask, fields = [point, content, executor, subexecutors, progress, dueDate, dueDate_subexecutors, control, control_by, priority, notify]}
      }
    ]
  },

  #policy{
    api_endpoint = createChild,
    combining    = any,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"},
    rules        = [
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [], status = [uncomplete], routing = [executor, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object_condition = form_check,
        values = fields,
        object = #object_form{id = outputOrder, fields = [urgent, document_type, nomenclature, corr, purpose, deputy, branch, head, executor, content, note, approvers, signatory, template]}
      },
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [], status = [uncomplete], routing = [executor, subexecutors, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object_condition = form_check,
        values = fields,
        object = #object_form{id = orgDoc, fields = [urgent, document_type, nomenclature, executor, branch, head, content, signatory, target, target_notify, dueDate, canceled, cancelDate, editDate, note, template]}
      },
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [], status = [uncomplete], routing = [executor, subexecutors, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object_condition = form_check,
        values = fields,
        object = #object_form{id = internalDoc, fields = [urgent, document_type, nomenclature, note, branch, head, executor, content, approvers, signatory, target, template]}
      },
      #rule{
        api_endpoint   = createChild,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor, subexecutors, notify], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = bizTask, fields = [point, content, executor, subexecutors, progress, dueDate, dueDate_subexecutors, control, control_by, priority, notify]}
      }
    ]
  },

% ---------------------- EDIT -----------------------------

  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor], routing = [registered_by], org = Default,  status = [uncomplete]},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = outputOrder, fields = [urgent, document_type, nomenclature, corr, purpose, deputy, branch, head, executor, content, note, approvers, signatory]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [approvers], status = [uncomplete, cancel], substitute_type = [delegat, tempDutiesPerform, []], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = outputOrder, fields = [approvers]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = outputOrder, fields = [urgent, document_type, nomenclature, purpose, corr, content, note, signatory]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = #sequenceFlow{source = "gwConverted", target = "SignatureImposition"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [signatory], org = Default,  status = [uncomplete]},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = outputOrder, fields = [nomenclature, corr, purpose, note]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = outputOrder, fields = [urgent, document_type, nomenclature, purpose, corr, content, note]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Send"},
    rules        = [
      #rule{
        api_endpoint      = edit,
        subject           = #subject_employee{roles = [register],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = outputOrder, fields = [corr, note]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = outputOrder, fields = [urgent, document_type, nomenclature, purpose, corr, content, note]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = #sequenceFlow{source = "gwNeedsCertification", target = "Certification"}},
    rules        = [
      #rule{
        api_endpoint      = edit,
        subject           = #subject_employee{roles = [certifier], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_form{id = outputOrder}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = outputOrder, fields = [urgent, document_type, nomenclature, purpose, corr, content, note]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = #sequenceFlow{source = "gwIsSent", target = "Grouping"}},
    rules        = [
      #rule{
        api_endpoint      = edit,
        subject           = #subject_employee{roles = [register],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = outputOrder, fields = [note, nomenclature]}
      }
    ]
  },

  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "Created", target = "Registration"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, headDep, head], routing = [registered_by],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = inputOrder, fields = [urgent, document_type, nomenclature, category, corr, topic, coordination, content, to, signed, number_out, date_out, note, dueDate, dueDateTime, main_sheets, add_sheets, device]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, headDep, head], routing = [registered_by],  org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = esqInquire, fields = [urgent, document_type, nomenclature, surname, name, patronymic, lawCertificate, authorityOrderNumber, category, corr, number_out, note, email, phone_number, koatuu_region, koatuu_place, form, address, house, surname_form, name_form, patronymic_form, dueDate, to, content, main_sheets, add_sheets, topic, coordination]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, headDep, head], routing = [registered_by],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = citizenInquire, fields = [document_type, nomenclature, date, surname, name, patronymic, gender, email, phone_number, subject, subject_count, author_type, social_status, address, house, content, issue, issue_type, issue_specie, form, averment, from, number_out, date_out, note, to, dueDate, result, main_sheets, add_sheets, topic, coordination]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, headDep, head], routing = [registered_by],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = deputyInquire, fields = [urgent, document_type, nomenclature,  number_out, date_out, note, request, committee, deputy, id_ndu, date_ndu, address_ndu, house, content, deputy_topic, category, corr, corr_from, surname, name, patronymic, email, phone_number, koatuu_region, koatuu_place, address, from, dueDate, to, main_sheets, add_sheets, topic, coordination]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, headDep, head], routing = [registered_by],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = adminService, fields = [urgent, document_type, nomenclature, category, corr, number_out, date_out, topic, coordination, content, to, note, dueDate, dueDateTime, main_sheets, add_sheets]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, headDep, head], routing = [registered_by],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = publicInquire, fields = [document_type, nomenclature, subject, subject_number, subjects, author_type, social_status, surname, name, patronymic, gender, category, corr, email, phone_number, address, house, content, issue, issue_type, form, averment, from, number_out, date_out, note, to, dueDate, main_sheets, add_sheets, topic, coordination]}
      }
    ]
  },

  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "gwNeedsDetermination", target = "Determination"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [registerDetermination],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = inputOrder, fields = [to]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [registerDetermination],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = esqInquire, fields = [to]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [registerDetermination],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = citizenInquire, fields = [to]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [registerDetermination],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = deputyInquire, fields = [to]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [registerDetermination],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = adminService, fields = [to]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [registerDetermination],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = publicInquire, fields = [to]}
      }
    ]
  },

  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = inputOrder, fields = [note, nomenclature]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = esqInquire, fields = [note, nomenclature]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = citizenInquire, fields = [note, nomenclature]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register],  org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = deputyInquire, fields = [note, nomenclature]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = adminService, fields = [note, nomenclature]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = publicInquire, fields = [note, nomenclature]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = internalDoc, fields = [urgent, document_type, nomenclature, note, branch, head, executor, content, approvers, signatory, target]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete, cancel], substitute_type = [delegat, tempDutiesPerform, []], routing = [approvers], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = internalDoc, fields = [approvers]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = internalDoc, fields = [urgent, document_type, nomenclature, content, note, signatory, target]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = #sequenceFlow{source = "gwConverted", target = "SignatureImposition"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = internalDoc, fields = [nomenclature, note]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = internalDoc, fields = [urgent, document_type, nomenclature, content, note, target]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = #sequenceFlow{source = "gwNeedsCertification", target = "Certification"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [certifier], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object         = #object_form{id = internalDoc}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = internalDoc, fields = [urgent, document_type, nomenclature, content, note, target]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = internalDoc, fields = [nomenclature, note]}
      }
    ]
  },

  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = orgDoc, fields = [urgent, document_type, nomenclature, executor, branch, head, content, signatory, target, target_notify, dueDate, canceled, cancelDate, editDate, note]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete, cancel], routing = [approvers], substitute_type = [tempDutiesPerform, delegat, []], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = orgDoc, fields = [approvers]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = orgDoc, fields = [urgent, document_type, nomenclature, content, signatory, target, target_notify, dueDate, canceled, cancelDate, editDate, note]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = #sequenceFlow{source = "gwConverted", target = "SignatureImposition"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = orgDoc, fields = [nomenclature, note]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = orgDoc, fields = [urgent, document_type, nomenclature, content, target, target_notify, dueDate, canceled, cancelDate, editDate, note]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = #sequenceFlow{source = "gwNeedsCertification", target = "Certification"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [certifier], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object         = #object_form{id = orgDoc}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = orgDoc, fields = [urgent, document_type, nomenclature, content, target, target_notify, dueDate, canceled, cancelDate, editDate, note]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = orgDoc, fields = [nomenclature, note]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = orgDoc, fields = [canceled, cancelDate, editDate]}
      }
    ]
  },

  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = #sequenceFlow{source = "gwRejected", target = "Archive"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = orgDoc, fields = [canceled, cancelDate, editDate]}
      }
    ]
  },

  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, operatorSEV, operatorEmail], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = sendOrder, fields = [corr, delivery_type]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [initiator], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = bizTask, fields = [content, point, executor, progress, dueDate, subexecutors, dueDate_subexecutors, notify, control, control_by, controller_comment, priority]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = #sequenceFlow{source = "gwConverted", target = "SignatureImposition"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [initiator], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = bizTask, fields = [content, point, executor, progress, dueDate, subexecutors, dueDate_subexecutors, notify, control, control_by, controller_comment, priority]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [control_by], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = bizTask, fields = [dueDate, dueDate_subexecutors, controller_comment]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor, subexecutors, initiator], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = bizTask, fields = [controller_comment]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "ImplementationControl"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [control_by], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = bizTask, fields = [dueDate, dueDate_subexecutors, controller_comment]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.PeriodicResolution.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [initiator], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = bizTask, fields = [content, point, executor, progress, dueDate, subexecutors, dueDate_subexecutors, notify, control, control_by, controller_comment, priority]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.PeriodicResolution.Proc', stage = #sequenceFlow{source = "Development", target = "SignatureImposition"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [initiator], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = bizTask, fields = [content, point, executor, progress, dueDate, subexecutors, dueDate_subexecutors, notify, control, control_by, controller_comment, priority]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = any,
    object       = #object_process{module = 'Elixir.PeriodicResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [control_by], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = bizTask, fields = [dueDate, dueDate_subexecutors, controller_comment]}
      },
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor, subexecutors, initiator], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = bizTask, fields = [controller_comment]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.PeriodicResolution.Proc', stage = "ImplementationControl"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [control_by], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = bizTask, fields = [dueDate, dueDate_subexecutors, controller_comment]}
      }
    ]
  },
  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.SendSEV.Proc', stage = #sequenceFlow{source = "Created", target = "SendSEV"}},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [operatorSEV], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = sendSevDoc, fields = [from, corr, annotation, kind, msg_type, inAnswerTo, purpose, dueDate, tasks]}
      }
    ]
  },

  #policy{
    api_endpoint = edit,
    combining    = all,
    object       = #object_process{module = 'Elixir.SendEmail.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint   = edit,
        subject        = #subject_employee{roles = [operatorEmail], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object         = #object_form{id = sendEmailDoc, fields = [from, to, subject, content]}
      }
    ]
  },

% ----------------------- VIEW ------------------------------

  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = rightsDelegation},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject           = #subject_employee{roles = [register, executor, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = rightsDelegation, fields = [user, delegateTo, startTime, endTime, tempDutiesPerform]}
      }
    ]
  },

  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = assistant},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject           = #subject_employee{roles = [admin, securityAdmin], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = assistant, fields = [head, assistants, startTime, endTime]}
      }
    ]
  },

  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = outputOrder},
    rules        = [
      #rule{
        api_endpoint   = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = outputOrder, fields = [id, date, urgent, document_type, nomenclature, corr, purpose, deputy, branch, head, executor, content, note, approvers, signatory, template, project]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = inputOrder},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = all,
        object            = #object_form{id = inputOrder, fields = [id, date, urgent, document_type, nomenclature, category, corr, topic, coordination, content, to, signed, number_out, date_out, note, dueDate, dueDateTime, main_sheets, add_sheets, device, project]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = esqInquire},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = esqInquire, fields = [id, date, urgent, document_type, nomenclature, surname, name, patronymic, lawCertificate, authorityOrderNumber, category, corr, number_out, note, email, phone_number, koatuu_region, koatuu_place, form, address, house, surname_form, name_form, patronymic_form, dueDate, to, content, main_sheets, add_sheets, topic, coordination, project]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = adminService},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = adminService, fields = [id, date, urgent, document_type, nomenclature, category, corr, number_out, date_out, topic, coordination, content, to, note, dueDate, dueDateTime, main_sheets, add_sheets, project]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = citizenInquire},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = citizenInquire, fields = [id, date, document_type, nomenclature, date, surname, name, patronymic, gender, email, phone_number, subject, subject_count, author_type, social_status, address, house, content, issue, issue_type, issue_specie, form, averment, from, number_out, date_out, note, to, dueDate, result, main_sheets, add_sheets, topic, coordination, project]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = publicInquire},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = publicInquire, fields = [id, date, document_type, nomenclature, subject, subject_number, subjects, author_type, social_status, surname, name, patronymic, gender, category, corr, email, phone_number, address, house, content, issue, issue_type, form, averment, from, number_out, date_out, note, to, dueDate, main_sheets, add_sheets, topic, coordination, project]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = deputyInquire},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = deputyInquire, fields = [id, date, urgent, document_type, nomenclature,  number_out, date_out, note, request, committee, deputy, id_ndu, date_ndu, address_ndu, house, content, deputy_topic, category, corr, corr_from, surname, name, patronymic, email, phone_number, koatuu_region, koatuu_place, address, from, dueDate, to, main_sheets, add_sheets, topic, coordination, project]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = internalDoc},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = internalDoc, fields = [id, date, urgent, document_type, nomenclature, note, branch, head, executor, content, approvers, signatory, target, template, project]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = orgDoc},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = orgDoc, fields = [id, date, urgent, document_type, nomenclature, executor, branch, head, content, signatory, approvers, target, target_notify, dueDate, canceled, cancelDate, editDate, note, template, project]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = bizTask},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = bizTask, fields = [id, initiator, content, point, executor, dueDate, progress, subexecutors, notify, control, control_by, controller_comment, priority, project]}
      }
    ]
  },

  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = autoTask},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = autoTask, fields = [id, type, registered_by, content, executor, notify, dueDate, date]}
      }
    ]
  },

  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = sendOrder},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = sendOrder, fields = [id, date_out, corr, delivery_type, content, signatory, status, date_sent, project]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = sendEmailDoc},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = sendEmailDoc, fields = [id, created_by, created, date_send, from, to, subject, content, email_type]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = receiveEmailDoc},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = receiveEmailDoc, fields = [id, created, from, to, subject, content, email_type]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = sendSevDoc},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = sendSevDoc, fields = [id, reg_number, date, created_by, created, sending_time, sent_by, from, corr, annotation, kind, msg_type, inAnswerTo, purpose, tasks, dueDate, errorcode, errortext, ack_type]}
      }
    ]
  },
  #policy{
    api_endpoint = view,
    combining    = all,
    object       = #object_form{id = receiveSevDoc},
    rules        = [
      #rule{
        api_endpoint      = view,
        subject        = #subject_employee{roles = [register, registerDetermination, operatorSEV, operatorEmail, executor, headDep, head, vice, controller, first, root, archivist, admin, securityAdmin, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = receiveSevDoc, fields = [id, reg_number, date, sending_time, receiving_time, registered_by, registering_time, from, corr, annotation, kind, msg_type, inAnswerTo, purpose, tasks, dueDate, errorcode, errortext, ack_type]}
      }
    ]
  },

% ----------------- VIEWFILEATTRIBUTES ------------------------

  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = inputOrder},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = deputyInquire},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = esqInquire},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = adminService},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = publicInquire},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = citizenInquire},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = bizTask},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [initiator, executor, subexecutors, control_by],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = template, convert = any, attributes = [main, sign]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = outputOrder},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor, approvers, signatory],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main, sign, cert]}
      },
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main, sign, cert]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = internalDoc},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor, approvers, signatory],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main, sign, cert]}
      },
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep, certifier],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main, sign, cert]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = orgDoc},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor, approvers, signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main, sign, cert]}
      },
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [certifier, register, executor, head, headDep], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main, sign, cert]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = sendOrder},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [register], status = [uncomplete], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = external, convert = any, attributes = [main, sign, cert]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = sendEmailDoc},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [operatorEmail], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = external, convert = any, attributes = [main, sign, cert]}
      }
    ]
  },
  #policy{
    api_endpoint = viewFileAttributes,
    combining    = any,
    object       = #object_form{id = sendSevDoc},
    rules        = [
      #rule{
        api_endpoint      = viewFileAttributes,
        subject           = #subject_employee{roles = [operatorSEV], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = external, sign = any, convert = any, attributes = [main, sign, cert]}
      }
    ]
  },

% ----------------- EDITFILEATTRIBUTES ------------------------

  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "Created", target = "Registration"}},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [register, executor, headDep, head], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [main]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "gwNeedsDetermination", target = "Determination"}},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [registerDetermination], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [main]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [main, sign, cert]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{sign = any, convert = any, attributes = [sign]}
      },
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [executor, register, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [cert]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{sign = any, convert = any, attributes = [sign]}
      },
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [executor, register, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [cert]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [certifier], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [cert]}
      },
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [executor, register, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [cert]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [main, sign, cert]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{sign = any, convert = any, attributes = [sign]}
      },
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [executor, register, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [cert]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{sign = any, convert = any, attributes = [sign]}
      },
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [executor, register, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [cert]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [certifier], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [cert]}
      },
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [executor, register, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [cert]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [main, sign, cert]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [sign]}
      },
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [executor, register, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [cert]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [sign]}
      },
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [executor, register, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [cert]}
      }
    ]
  },
  #policy{
    api_endpoint = editFileAttributes,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [certifier], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any, attributes = [cert]}
      },
      #rule{
        api_endpoint      = editFileAttributes,
        subject           = #subject_employee{roles = [executor, register, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any, attributes = [cert]}
      }
    ]
  },

% ---------------------- EDITFILE -----------------------------

  #policy{
    api_endpoint = editFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = editFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any}
      },
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = editFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any}
      },
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any}
      }
    ]
  },

  #policy{
    api_endpoint = editFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = editFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any}
      },
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = editFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any}
      },
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = editFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = editFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any}
      },
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = editFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, convert = any}
      },
      #rule{
        api_endpoint      = editFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        values            = attributes,
        resource_match    = any,
        object            = #object_file{type = any, sign = any, convert = any}
      }
    ]
  },

% ---------------------- ADDFILE ------------------------------

  #policy{
    api_endpoint = addFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "Created", target = "Registration"}},
    rules        = [
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, headDep, head], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "Created", target = "Registration"}}
      }
    ]
  },
  #policy{
    api_endpoint = addFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "gwNeedsDetermination", target = "Determination"}},
    rules        = [
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [registerDetermination], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "gwNeedsDetermination", target = "Determination"}}
      }
    ]
  },
  #policy{
    api_endpoint = addFile,
    combining    = any,
    object       = #object_form{id = bizTask},
    rules        = [
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [executor, subexecutors, initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.PeriodicResolution.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [executor, subexecutors, initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.PeriodicResolution.Proc', stage = "Execution"}
      }
    ]
  },

  #policy{
    api_endpoint = addFile,
    combining    = any,
    object       = #object_form{id = outputOrder},
    rules        = [
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Certification"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Send"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Send"}
      }
    ]
  },

  #policy{
    api_endpoint = addFile,
    combining    = any,
    object       = #object_form{id = internalDoc},
    rules        = [
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Certification"}
      }
    ]
  },
  #policy{
    api_endpoint = addFile,
    combining    = any,
    object       = #object_form{id = orgDoc},
    rules        = [
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Certification"}
      }
    ]
  },
  #policy{
    api_endpoint = addFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [register], status = [uncomplete], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.Send.Proc', stage = "Development"}
      }
    ]
  },
  #policy{
    api_endpoint = addFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.SendEmail.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [operatorEmail], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.SendEmail.Proc', stage = "Development"}
      }
    ]
  },
  #policy{
    api_endpoint = addFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.SendSEV.Proc', stage = "SendSEV"},
    rules        = [
      #rule{
        api_endpoint      = addFile,
        subject           = #subject_employee{roles = [operatorSEV], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.SendSEV.Proc', stage = "SendSEV"}
      }
    ]
  },

% -------------------- DELETEFILE ---------------------------

  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "Created", target = "Registration"}},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, headDep, head], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_file{sign = false, needCert = false, certificate = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "gwNeedsDetermination", target = "Determination"}},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [registerDetermination], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_file{sign = false, needCert = false, certificate = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_file{sign = false, needCert = false, certificate = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = #sequenceFlow{source = "gwConverted", target = "SignatureImposition"}},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [executor, subexecutors, initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.PeriodicResolution.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_file{sign = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.PeriodicResolution.Proc', stage = #sequenceFlow{source = "Development", target = "Signing"}},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.PeriodicResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [executor, subexecutors, initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{type = any, sign = false, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      },
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      },
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [signatory, registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Send"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      },
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      }
    ]
  },

  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{type = any, sign = false, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      },
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      },
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      }
    ]
  }
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{type = any, sign = false, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      },
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      },
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register, executor, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [register], status = [uncomplete], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.SendEmail.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [operatorEmail], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = deleteFile,
    combining    = any,
    object       = #object_process{module = 'Elixir.SendSEV.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = deleteFile,
        subject           = #subject_employee{roles = [operatorSEV], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = false, convert = any, needCert = false}
      }
    ]
  },

% ------------------- FILEVERSION ---------------------------

  #policy{
    api_endpoint = fileVersion,
    combining    = any,
    object       = #object_form{id = outputOrder},
    rules        = [
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = uncomplete, routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = uncomplete, routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [admin, securityAdmin], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [admin, securityAdmin], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [admin, securityAdmin], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"}
      }
    ]
  },
  #policy{
    api_endpoint = fileVersion,
    combining    = any,
    object       = #object_form{id = internalDoc},
    rules        = [
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = uncomplete, routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = uncomplete, routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [admin, securityAdmin], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [admin, securityAdmin], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [admin, securityAdmin], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"}
      }
    ]
  },
  #policy{
    api_endpoint = fileVersion,
    combining    = any,
    object       = #object_form{id = orgDoc},
    rules        = [
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = uncomplete, routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = uncomplete, routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [admin, securityAdmin], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [admin, securityAdmin], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint      = fileVersion,
        subject           = #subject_employee{roles = [admin, securityAdmin], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"}
      }
    ]
  },

% ---------------------- DELETE -----------------------------

  #policy{
    api_endpoint = delete,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [register, executor], substitute_type = [], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Development"}
      }
    ]
  },
  #policy{
    api_endpoint = delete,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "Created", target = "Registration"}},
    rules        = [
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "Created", target = "Registration"}}
      }
    ]
  },

  #policy{
    api_endpoint = delete,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [executor, head], substitute_type = [], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Development"}
      }
    ]
  },
  #policy{
    api_endpoint = delete,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [executor, head], substitute_type = [], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Development"}
      }
    ]
  },
  #policy{
    api_endpoint = delete,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Development"}
      },
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Development"}
      }
    ]
  },
  #policy{
    api_endpoint = delete,
    combining    = any,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [admin, securityAdmin, register], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.Send.Proc', stage = "Development"}
      }
    ]
  },
  #policy{
    api_endpoint = delete,
    combining    = any,
    object       = #object_process{module = 'Elixir.SendEmail.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [admin, securityAdmin, register, operatorEmail], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.SendEmail.Proc', stage = "Development"}
      }
    ]
  },
  #policy{
    api_endpoint = delete,
    combining    = any,
    object       = #object_process{module = 'Elixir.SendSEV.Proc', stage = #sequenceFlow{source = "Created", target = "SendSEV"}},
    rules        = [
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [admin, securityAdmin, register, operatorSEV], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.SendSEV.Proc', stage = #sequenceFlow{source = "Created", target = "SendSEV"}}
      }
    ]
  },
  #policy{
    api_endpoint = delete,
    combining    = any,
    object       = #object_process{module = 'Elixir.ReceiveEmail.Proc', stage = "AcceptOrReject"},
    rules        = [
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [admin, securityAdmin, operatorEmail], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.ReceiveEmail.Proc', stage = "AcceptOrReject"}
      }
    ]
  },
  #policy{
    api_endpoint = delete,
    combining    = any,
    object       = #object_process{module = 'Elixir.ReceiveSEV.Proc', stage = #sequenceFlow{source = "Download", target = "AcceptOrReject"}},
    rules        = [
      #rule{
        api_endpoint      = delete,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.ReceiveSEV.Proc', stage = #sequenceFlow{source = "Download", target = "AcceptOrReject"}}
      }
    ]
  },


% ---------------------- REJECT -----------------------------

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [register, executor], status = [uncomplete], routing = [to],  org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration", sched = [
          #sequenceFlow{id = "sf_Init_Registration", source = "Created", target = "Registration"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "Determination"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [registerDetermination], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInput.Proc', stage = "Determination", sched = [
          #sequenceFlow{id = "sf_Init_Registration", source = "Created", target = "Registration"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation", sched = [
          #sequenceFlow{id = "sf_Init_Registration", source = "Created", target = "Registration"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "Archive"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInput.Proc', stage = "Archive", sched = [
          #sequenceFlow{id = "sf_gwConfirmation_Grouping", source = "gwConfirmation", target = "Grouping"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], status = [uncomplete], routing = [initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_Created_Development", source = "Created", target = "Development"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement", sched = [
          #sequenceFlow{id = "sf_gwAgreed_Development", source = "gwAgreed", target = "Development"}
        ]}
      },
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement", sched = [
          #sequenceFlow{id = "sf_gwAgreed_Development", source = "gwAgreed", target = "Development"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_gwSigned_Development", source = "gwSigned", target = "Development"}
        ]}
      },
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_gwSigned_Development", source = "gwSigned", target = "Development"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_Agreement_gwAgreed", source = "Agreement", target = "gwAgreed"}
        ]}
      },
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [executor, register, head, headDep], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_Agreement_gwAgreed", source = "Agreement", target = "gwAgreed"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Send"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Send", sched = [
          #sequenceFlow{id = "sf_gwConverted_SignatureImposition", source = "gwConverted", target = "SignatureImposition"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Send"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Send", sched = [
          #sequenceFlow{id = "sf_gwNeedsCertification_Certification", source = "gwNeedsCertification", target = "Certification"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Sending"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Sending", sched = [
          #sequenceFlow{id = "sf_gwNeedsCertification_Send", source = "gwNeedsCertification", target = "Send"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Grouping"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Grouping", sched = [
          #sequenceFlow{id = "sf_Send_Sending", source = "Send", target = "Sending"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Archive"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Archive", sched = [
          #sequenceFlow{id = "sf_gwIsSent_Grouping", source = "gwIsSent", target = "Archive"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement", sched = [
          #sequenceFlow{id = "sf_gwAgreed_Development", source = "gwAgreed", target = "Development"}
        ]}
      },
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement", sched = [
          #sequenceFlow{id = "sf_gwAgreed_Development", source = "gwAgreed", target = "Development"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_gwSigned_Development", source = "gwSigned", target = "Development"}
        ]}
      },
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_gwSigned_Development", source = "gwSigned", target = "Development"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_Agreement_gwAgreed", source = "Agreement", target = "gwAgreed"}
        ]}
      },
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [executor, head, headDep, register], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_Agreement_gwAgreed", source = "Agreement", target = "gwAgreed"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Implementation"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Implementation", sched = [
          #sequenceFlow{id = "sf_gwNeedsCertification_Certification", source = "gwNeedsCertification", target = "Certification"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Implementation"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Implementation", sched = [
          #sequenceFlow{id = "sf_Init_Development", source = "Created", target = "Development"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Archive"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Archive", sched = [
          #sequenceFlow{id = "sf_gwConfirmation_Grouping", source = "gwConfirmation", target = "Grouping"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement", sched = [
          #sequenceFlow{id = "sf_gwAgreed_Development", source = "gwAgreed", target = "Development"}
        ]}
      },
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement", sched = [
          #sequenceFlow{id = "sf_gwAgreed_Development", source = "gwAgreed", target = "Development"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], status = [uncomplete], routing = [signatory], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_gwSigned_Development", source = "gwSigned", target = "Development"}
        ]}
      },
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [head, register, executor], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_gwSigned_Development", source = "gwSigned", target = "Development"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_Agreement_gwAgreed", source = "Agreement", target = "gwAgreed"}
        ]}
      },
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [executor, head, headDep, register], routing = [registered_by], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition", sched = [
          #sequenceFlow{id = "sf_Agreement_gwAgreed", source = "Agreement", target = "gwAgreed"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Implementation"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Implementation", sched = [
          #sequenceFlow{id = "sf_gwNeedsCertification_Certification", source = "gwNeedsCertification", target = "Certification"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Implementation"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Implementation", sched = [
          #sequenceFlow{id = "sf_Init_Development", source = "Created", target = "Development"}
        ]}
      }
    ]
  },

  #policy{
    api_endpoint = reject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Archive"},
    rules        = [
      #rule{
        api_endpoint      = reject,
        subject           = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = sched_check,
        values            = sched,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Archive", sched = [
          #sequenceFlow{id = "sf_gwConfirmation_Grouping", source = "gwConfirmation", target = "Grouping"}
        ]}
      }
    ]
  },

% ---------------------- PREVREJECT -----------------------------

  #policy{
    api_endpoint = prevReject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = any, type = any}
      }
    ]
  },

  #policy{
    api_endpoint = prevReject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = any, type = any}
      }
    ]
  },

  #policy{
    api_endpoint = prevReject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}},
    rules        = [
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, type = any}
      }
    ]
  },

  #policy{
    api_endpoint = prevReject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [admin, securityAdmin], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = any, type = any}
      }
    ]
  },

  #policy{
    api_endpoint = prevReject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}},
    rules        = [
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, type = any}
      }
    ]
  },

  #policy{
    api_endpoint = prevReject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}},
    rules        = [
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object         = #object_file{sign = false, needCert = false, certificate = false}
      }
    ]
  },

  #policy{
    api_endpoint = prevReject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [register, executor, head], status = [uncomplete], routing = [executor, subexecutors, initiator], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, needCert = false, certificate = false, type = template}
      }
    ]
  },

  #policy{
    api_endpoint = prevReject,
    combining    = any,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "ImplementationControl"},
    rules        = [
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [controller], status = [uncomplete], routing = [control_by], substitute_type = [delegat, tempDutiesPerform, []], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, needCert = false, certificate = false, type = template}
      }
    ]
  },

  #policy{
    api_endpoint = prevReject,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Executed"},
    rules        = [
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [register, executor], routing = [initiator], status = [uncomplete], substitute_type = [delegat, tempDutiesPerform, []], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, needCert = false, certificate = false, type = template}
      }
    ]
  },

  #policy{
    api_endpoint = prevReject,
    combining    = any,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = "Sending"},
    rules        = [
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [register, operatorEmail, operatorSEV], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{convert = any, type = external}
      },
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [register, operatorEmail, operatorSEV], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{convert = any, type = external}
      }
    ]
  },

  #policy{
    api_endpoint = prevReject,
    combining    = all,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = "Sent"},
    rules        = [
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{convert = any, type = external}
      },
      #rule{
        api_endpoint   = prevReject,
        subject        = #subject_employee{roles = [register], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = executor_check,
        resource_match = any,
        object         = #object_executor{roles = [register, operatorEmail, operatorSEV]}
      }
    ]
  },

  #policy{
    api_endpoint = parentReject,
    combining    = any,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = #sequenceFlow{source = "Created", target = "Development"}},
    rules        = [
      #rule{
        api_endpoint   = parentReject,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        resource_match = any,
        object         = #object_executor{routing = [target, notify], status = [uncomplete], type = <<"output">>}
      }
    ]
  },

  #policy{
    api_endpoint = parentReject,
    combining    = any,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = #sequenceFlow{source = "Development", target = "Sending"}},
    rules        = [
      #rule{
        api_endpoint   = parentReject,
        subject        = #subject_employee{roles = [register], substitute_type = [], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = executor_check,
        resource_match = any,
        object         = #object_executor{routing = [target, notify], status = [uncomplete], type = <<"output">>}
      }
    ]
  },

  #policy{
    api_endpoint = parentReject,
    combining    = any,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = #sequenceFlow{source = "gwIsSent", target = "Sent"}},
    rules        = [
      #rule{
        api_endpoint   = parentReject,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = executor_check,
        resource_match = any,
        object         = #object_executor{routing = [target, notify], status = [uncomplete], type = <<"output">>}
      }
    ]
  },
% ---------------------- PRINT -----------------------------

  #policy{
    api_endpoint = print,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "Created", target = "Registration"}},
    rules        = [
      #rule{
        api_endpoint      = print,
        subject           = #subject_employee{roles = [register], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "Created", target = "Registration"}}
      }
    ]
  },

% ---------------------- SIGN -----------------------------

  #policy{
    api_endpoint = signCreate,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = signCreate,
        subject           = #subject_employee{roles = [register, executor], substitute_type = [], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = true, type = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = signCreate,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = signCreate,
        subject           = #subject_employee{roles = [register, executor], substitute_type = [], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = true, type = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = signCreate,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint      = signCreate,
        subject           = #subject_employee{roles = [register, executor], substitute_type = [], status = [uncomplete], routing = [executor], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = true, type = any, convert = any}
      }
    ]
  },
  
  #policy{
    api_endpoint = delegateAgreement,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = delegateAgreement,
        subject           = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [delegat, tempDutiesPerform, []], status = [cancel], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = true, type = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = delegateAgreement,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = delegateAgreement,
        subject           = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [delegat, tempDutiesPerform, []], status = [cancel], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = true, type = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = delegateAgreement,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint      = delegateAgreement,
        subject           = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [delegat, tempDutiesPerform, []], status = [cancel], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = true, type = any, convert = any}
      }
    ]
  },

  #policy{
    api_endpoint = agree,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = agree,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [delegat, tempDutiesPerform, []], status = [uncomplete], routing = [approvers], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, type = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = agree,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = agree,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [delegat, tempDutiesPerform, []], status = [uncomplete], routing = [approvers], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, type = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = agree,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = agree,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [delegat, tempDutiesPerform, []], status = [uncomplete], routing = [approvers], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, type = any, convert = any}
      }
    ]
  },
  #policy{
    api_endpoint = sign,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = sign,
        subject        = #subject_employee{roles = [register, executor], status = [uncomplete], substitute_type = [delegat, tempDutiesPerform, []], routing = [signatory], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = any, type = any}
      }
    ]
  },
  #policy{
    api_endpoint = sign,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = sign,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [delegat, tempDutiesPerform, []], status = [uncomplete], routing = [signatory], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = any, type = any}
      }
    ]
  },
  #policy{
    api_endpoint = sign,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = sign,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [delegat, tempDutiesPerform, []], status = [uncomplete], routing = [signatory], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = any, type = any}
      } 
    ]
  },

  #policy{
    api_endpoint = sign,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = sign,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [delegat, tempDutiesPerform, []], status = [uncomplete], routing = [initiator], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{type = any, sign = true, convert = any}
      }
    ]
  },

  #policy{
    api_endpoint = certify,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint   = certify,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{type = any, convert = any, needCert = true, certificate = true}
      }
    ]
  },
  #policy{
    api_endpoint = certify,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint   = certify,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{type = any, convert = any, needCert = true, certificate = true}
      }
    ]
  },
  #policy{
    api_endpoint = certify,     
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint   = certify,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{type = any, convert = any, needCert = true, certificate = true}
      }
    ]
  },

  #policy{
    api_endpoint = familiarize,
    combining    = all,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"},
    rules        = [
      #rule{
        api_endpoint   = familiarize,
        subject        = #subject_employee{roles = [register, executor, head, headDep], substitute_type = [tempDutiesPerform, delegat, []], status = [uncomplete], routing = [notify], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{type = any, sign = true, convert = any}
      }
    ]
  },

% ---------------------- RETRYQR -----------------------------

  #policy{
    api_endpoint = retryQr,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = #sequenceFlow{source = "gwConverted", target = "Convert"}},
    rules        = [
      #rule{
        api_endpoint      = retryQr,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [initiator], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = true, type = any, convert = failed}
      }
    ]
  },

  #policy{
    api_endpoint = retryQr,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = #sequenceFlow{source = "gwConverted", target = "Convert"}},
    rules        = [
      #rule{
        api_endpoint      = retryQr,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = true, type = any, convert = failed}
      }
    ]
  },

  #policy{
    api_endpoint = retryQr,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = #sequenceFlow{source = "gwConverted", target = "Convert"}},
    rules        = [
      #rule{
        api_endpoint      = retryQr,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = true, type = any, convert = failed}
      }
    ]
  },

  #policy{
    api_endpoint = retryQr,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = #sequenceFlow{source = "gwConverted", target = "Convert"}},
    rules        = [
      #rule{
        api_endpoint      = retryQr,
        subject           = #subject_employee{roles = [register, executor, head, headDep], status = [uncomplete], routing = [approvers], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = file_check,
        resource_match    = any,
        object            = #object_file{sign = true, type = any, convert = failed}
      }
    ]
  },

% ---------------------- SEARCH -----------------------------

  #policy{
    api_endpoint = search,
    combining    = all,
    object       = #object_form{id = inputOrder},
    rules        = [
      #rule{
        api_endpoint      = search,
        subject           = #subject_employee{roles = [register, admin, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = inputOrder, fields = [id, date, document_type, nomenclature, category, corr, topic, coordination, content, to, signed, number_out, date_out, note, dueDateTime]}
      }
    ]
  },
  #policy{
    api_endpoint = search,
    combining    = all,
    object       = #object_form{id = esqInquire},
    rules        = [
      #rule{
        api_endpoint      = search,
        subject           = #subject_employee{roles = [register, admin, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = esqInquire, fields = [id, date, document_type, nomenclature, surname, name, patronymic, lawCertificate, authorityOrderNumber, category, corr, number_out, note, email, phone_number, koatuu_region, koatuu_place, form, address, house, surname_form, name_form, patronymic_form, dueDate, to, content, topic, coordination]}
      }
    ]
  },
  #policy{
    api_endpoint = search,
    combining    = all,
    object       = #object_form{id = adminService},
    rules        = [
      #rule{
        api_endpoint      = search,
        subject           = #subject_employee{roles = [register, admin, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = adminService, fields = [id, date, document_type, nomenclature, category, corr, number_out, date_out, topic, coordination, content, to, note, dueDateTime]}
      }
    ]
  },
  #policy{
    api_endpoint = search,
    combining    = all,
    object       = #object_form{id = citizenInquire},
    rules        = [
      #rule{
        api_endpoint      = search,
        subject           = #subject_employee{roles = [register, admin, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = citizenInquire, fields = [id, date, document_type, nomenclature, date, surname, name, patronymic, gender, email, phone_number, subject, subject_count, author_type, social_status, address, house, content, issue, issue_type, issue_specie, form, averment, from, number_out, date_out, note, to, result, topic, coordination]}
      }
    ]
  },
  #policy{
    api_endpoint = search,
    combining    = all,
    object       = #object_form{id = publicInquire},
    rules        = [
      #rule{
        api_endpoint      = search,
        subject           = #subject_employee{roles = [register, admin, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = publicInquire, fields = [id, date, document_type, nomenclature, subject, subject_number, subjects, author_type, social_status, surname, name, patronymic, gender, category, corr, email, phone_number, address, house, content, issue, issue_type, form, averment, from, number_out, date_out, note, to, topic, coordination]}
      }
    ]
  },
  #policy{
    api_endpoint = search,
    combining    = all,
    object       = #object_form{id = deputyInquire},
    rules        = [
      #rule{
        api_endpoint      = search,
        subject           = #subject_employee{roles = [register, admin, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = deputyInquire, fields = [id, date, document_type, nomenclature,  number_out, date_out, note, request, committee, deputy, id_ndu, date_ndu, address_ndu, house, content, deputy_topic, category, corr, corr_from, surname, name, patronymic, email, phone_number, koatuu_region, koatuu_place, address, from, to, topic, coordination]}
      }
    ]
  },
  #policy{
    api_endpoint = search,
    combining    = all,
    object       = #object_form{id = outputOrder},
    rules        = [
      #rule{
        api_endpoint      = search,
        subject           = #subject_employee{roles = [register, admin, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = outputOrder, fields = [id, date, document_type, nomenclature, corr, purpose, deputy, branch, head, executor, content, note, approvers, signatory]}
      }
    ]
  },
  #policy{
    api_endpoint = search,
    combining    = all,
    object       = #object_form{id = bizTask},
    rules        = [
      #rule{
        api_endpoint      = search,
        subject           = #subject_employee{roles = [register, admin, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = bizTask, fields = [initiator, content, point, executor, dueDate, progress, subexecutors, notify, control, control_by, controller_comment, priority]}
      }
    ]
  },
  #policy{
    api_endpoint = search,
    combining    = all,
    object       = #object_form{id = orgDoc},
    rules        = [
      #rule{
        api_endpoint      = search,
        subject           = #subject_employee{roles = [register, admin, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = orgDoc, fields = [id, date, document_type, nomenclature, executor, branch, head, content, signatory, target, target_notify, dueDate, canceled, cancelDate, editDate, note]}
      }
    ]
  },
  #policy{
    api_endpoint = search,
    combining    = all,
    object       = #object_form{id = internalDoc},
    rules        = [
      #rule{
        api_endpoint      = search,
        subject           = #subject_employee{roles = [register, admin, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = internalDoc, fields = [id, date, document_type, nomenclature, note, branch, head, executor, content, approvers, signatory, target]}
      }
    ]
  },
  #policy{
    api_endpoint = search,
    combining    = all,
    object       = #object_form{id = commonDoc},
    rules        = [
      #rule{
        api_endpoint      = search,
        subject           = #subject_employee{roles = [register, admin, head], org = Default},
        type              = permit,
        subject_condition = employee_check,
        object_condition  = form_check,
        values            = fields,
        resource_match    = any,
        object            = #object_form{id = commonDoc, fields = [document_atom, id, date, nomenclature, content, corr, branch, start_time, end_time]}
      }
    ]
  },

% ---------------------- REGISTER -------------------------

  #policy{
    api_endpoint = register,
    combining    = any,
    object       = #object_process{module = 'Elixir.ReceiveEmail.Proc', stage = "AcceptOrReject"},
    rules        = [
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorEmail], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = inputOrder, fields = [urgent, document_type, nomenclature, category, corr, topic, coordination, content, to, signed, number_out, date_out, note, dueDate, dueDateTime, main_sheets, add_sheets, device]}
      },
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorEmail], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = esqInquire, fields = [urgent, document_type, nomenclature, surname, name, patronymic, lawCertificate, authorityOrderNumber, category, corr, number_out, note, phone_number, koatuu_region, koatuu_place, address, house, surname_form, name_form, patronymic_form, dueDate, to, content, main_sheets, add_sheets, topic, coordination]}
      },
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorEmail], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = adminService, fields = [urgent, document_type, nomenclature, category, corr, number_out, date_out, topic, coordination, content, to, note, dueDate, dueDateTime, main_sheets, add_sheets]}
      },
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorEmail], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = deputyInquire, fields = [urgent, document_type, nomenclature,  number_out, date_out, note, request, committee, deputy, id_ndu, date_ndu, address_ndu, house, content, deputy_topic, category, corr, corr_from, surname, name, patronymic, phone_number, koatuu_region, koatuu_place, address, from, dueDate, to, main_sheets, add_sheets, topic, coordination]}
      },
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorEmail], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = publicInquire, fields = [document_type, nomenclature, subject, subject_number, subjects, author_type, social_status, surname, name, patronymic, gender, category, corr, phone_number, address, house, content, issue, issue_type, averment, from, number_out, date_out, note, to, dueDate, main_sheets, add_sheets, topic, coordination]}
      },
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorEmail], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = citizenInquire, fields = [document_type, nomenclature, date, surname, name, patronymic, gender, phone_number, subject, subject_count, author_type, social_status, address, house, content, issue, issue_type, issue_specie, averment, from, number_out, date_out, note, to, dueDate, result, main_sheets, add_sheets, topic, coordination]}
      }
    ]
  },
  #policy{
    api_endpoint = register,
    combining    = any,
    object       = #object_process{module = 'Elixir.ReceiveSEV.Proc', stage = "AcceptOrReject"},
    rules        = [
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorSEV], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = inputOrder, fields = [urgent, document_type, nomenclature, category, corr, topic, coordination, content, to, signed, number_out, date_out, note, dueDate, dueDateTime, main_sheets, add_sheets, device]}
      },
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorSEV], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = esqInquire, fields = [urgent, document_type, nomenclature, surname, name, patronymic, lawCertificate, authorityOrderNumber, category, corr, number_out, note, email, phone_number, koatuu_region, koatuu_place, form, address, house, surname_form, name_form, patronymic_form, dueDate, to, content, main_sheets, add_sheets, topic, coordination]}
      },
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorSEV], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = adminService, fields = [urgent, document_type, nomenclature, category, corr, number_out, date_out, topic, coordination, content, to, note, dueDate, dueDateTime, main_sheets, add_sheets]}
      },
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorSEV], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = deputyInquire, fields = [urgent, document_type, nomenclature,  number_out, date_out, note, request, committee, deputy, id_ndu, date_ndu, address_ndu, house, content, deputy_topic, category, corr, corr_from, surname, name, patronymic, email, phone_number, koatuu_region, koatuu_place, address, from, dueDate, to, main_sheets, add_sheets, topic, coordination]}
      },
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorSEV], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = publicInquire, fields = [document_type, nomenclature, subject, subject_number, subjects, author_type, social_status, surname, name, patronymic, gender, category, corr, email, phone_number, address, house, content, issue, issue_type, form, averment, from, number_out, date_out, note, to, dueDate, main_sheets, add_sheets, topic, coordination]}
      },
      #rule{
        api_endpoint   = register,
        subject        = #subject_employee{roles = [operatorSEV], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = form_check,
        values         = fields,
        resource_match = any,
        object            = #object_form{id = citizenInquire, fields = [document_type, nomenclature, date, surname, name, patronymic, gender, email, phone_number, subject, subject_count, author_type, social_status, address, house, content, issue, issue_type, issue_specie, form, averment, from, number_out, date_out, note, to, dueDate, result, main_sheets, add_sheets, topic, coordination]}
      }
    ]
  },

% ---------------------- CANCEL -----------------------------

  #policy{
    api_endpoint = cancel,
    combining    = all,
    object       = #object_process{module = 'Elixir.ReceiveEmail.Proc', stage = "AcceptOrReject"},
    rules        = [
      #rule{
        api_endpoint      = cancel,
        subject           = #subject_employee{roles = [operatorEmail], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.ReceiveEmail.Proc', stage = "AcceptOrReject"}
      }
    ]
  },

  #policy{
    api_endpoint = cancel,
    combining    = all,
    object       = #object_process{module = 'Elixir.ReceiveSEV.Proc', stage = "AcceptOrReject"},
    rules        = [
      #rule{
        api_endpoint      = cancel,
        subject           = #subject_employee{roles = [operatorSEV], substitute_type = [], org = Default},
        type              = permit,
        subject_condition = employee_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.ReceiveSEV.Proc', stage = "AcceptOrReject"}
      }
    ]
  },

% ---------------------- NEXT -----------------------------

  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "Created", target = "Registration"}},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "Created", target = "Registration"}, sched = [#sequenceFlow{id = "sf_Registration_gwNeedsDetermination", source = "Registration", target = "gwNeedsDetermination"}]}
      },
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_file{sign = false, needCert = false, certificate = false}
      }
    ]
  },

 #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "gwNeedsDetermination", target = "Determination"}},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [registerDetermination], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "gwNeedsDetermination", target = "Determination"}, sched = [#sequenceFlow{id = "sf_Determination_InitialConsideration", source = "Determination", target = "InitialConsideration"}]}
      }
    ]
  },

   #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register, executor], routing = [initiator], status = [uncomplete], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Development", sched = [#sequenceFlow{id = "sf_Development_Convert", source = "Development", target = "Convert"}]}
      },
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register, executor], routing = [initiator], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, type = template, convert = any, needCert = false, certificate = false}
      }
    ]
  },

  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Send"},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Send", sched = [#sequenceFlow{id = "sf_Send_Sending", source = "Send", target = "Sending"}]}
      },
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = any, type = any}
      }
    ]
  },

  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Sending", status = true},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Sending", status = true, sched = [#sequenceFlow{id = "sf_Sending_gwIsSent", source = "Sending", target = "gwIsSent"}]}
      },
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = any, type = any}
      }
    ]
  },

  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Grouping"},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Grouping", sched = [#sequenceFlow{id = "sf_Grouping_Archive", source = "Grouping", target = "Archive"}]}
      },
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = any, type = any}
      }
    ]
  },

  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.Send.Proc', stage = "Development", sched = [#sequenceFlow{id = "sf_Development_Sending", source = "Development", target = "Sending"}]}
      },
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, type = external}
      }
    ]
  },
  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = "Sending"},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.Send.Proc', stage = "Sending", sched = [#sequenceFlow{id = "sf_Sending_gwIsRejected", source = "Sending", target = "gwIsRejected"}]}
      },
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = executor_check,
        resource_match = any,
        object         = #object_executor{status = [uncomplete]}
      }
    ]
  },
  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = "Sending"},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], status = [uncomplete], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.Send.Proc', stage = "Sending", sched = [#sequenceFlow{id = "sf_Sending_gwIsRejected", source = "Sending", target = "gwIsRejected"}]}
      },
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = executor_check,
        resource_match = any,
        object         = #object_executor{status = [uncomplete]}
      }
    ]
  },
  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.SendEmail.Proc', stage = "Development"},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [operatorEmail], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.SendEmail.Proc', stage = "Development", sched = [#sequenceFlow{id = "sf_Development_SendEmail", source = "Development", target = "SendEmail"}]}
      },
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [operatorEmail], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = any, type = any}
      }
    ]
  },

  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}, sched = [#sequenceFlow{id = "sf_Grouping_gwRejected", source = "Grouping", target = "gwRejected"}]}
      }
    ]
  },

  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}, sched = [#sequenceFlow{id = "sf_Grouping_gwRejected", source = "Grouping", target = "gwRejected"}]}
      }
    ]
  },

  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = #sequenceFlow{source = "gwConfirmation", target = "Grouping"}, sched = [#sequenceFlow{id = "sf_Grouping_gwRejected", source = "Grouping", target = "gwRejected"}]}
      }
    ]
  },

  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.SendSEV.Proc', stage = "SendSEV"},
    rules        = [
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [operatorSEV], substitute_type = [], org = Default},
        type           = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.SendSEV.Proc', stage = "SendSEV", sched = [#sequenceFlow{id = "sf_SendSEV_Acknowledge", source = "SendSEV", target = "Acknowledge"}]}
      },
      #rule{
        api_endpoint   = next,
        subject        = #subject_employee{roles = [operatorSEV], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = any, type = any}
      }
    ]
  },
  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint      = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type              = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Certification", sched = [#sequenceFlow{id = "sf_Certification_Send", source = "Certification", target = "Send"}]}
      },
      #rule{
        api_endpoint   = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = all,
        object         = #object_file{type = any, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint      = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type              = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Certification", sched = [#sequenceFlow{id = "sf_Certification_Send", source = "Certification", target = "Send"}]}
      },
      #rule{
        api_endpoint   = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = all,
        object         = #object_file{type = any, convert = any, certificate = false}
      }
    ]
  },
  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint      = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type              = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Certification", sched = [#sequenceFlow{id = "sf_Certification_Implementation", source = "Certification", target = "Implementation"}]}
      },
      #rule{
        api_endpoint   = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = all,
        object         = #object_file{type = any, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint      = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type              = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Certification", sched = [#sequenceFlow{id = "sf_Certification_Implementation", source = "Certification", target = "Implementation"}]}
      },
      #rule{
        api_endpoint   = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = all,
        object         = #object_file{type = any, convert = any, certificate = false}
      }
    ]
  },
  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint      = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type              = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Certification", sched = [#sequenceFlow{id = "sf_Certification_Implementation", source = "Certification", target = "Implementation"}]}
      },
      #rule{
        api_endpoint   = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = all,
        object         = #object_file{type = any, convert = any, needCert = false}
      }
    ]
  },
  #policy{
    api_endpoint = next,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Certification"},
    rules        = [
      #rule{
        api_endpoint      = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type              = permit,
        values         = sched,
        subject_condition = employee_check,
        object_condition = sched_check,
        resource_match    = any,
        object            = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Certification", sched = [#sequenceFlow{id = "sf_Certification_Implementation", source = "Certification", target = "Implementation"}]}
      },
      #rule{
        api_endpoint   = next,
        subject           = #subject_employee{roles = [certifier], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = all,
        object         = #object_file{type = any, convert = any, certificate = false}
      }
    ]
  },

% ---------------------- EXECUTE -----------------------------

  #policy{
    api_endpoint = execute,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = execute,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [delegat, tempDutiesPerform, []], routing = [executor, subexecutors], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, needCert = false, certificate = false, type = template}
      }
    ]
  },

  #policy{
    api_endpoint = execute,
    combining    = all,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = execute,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [delegat, tempDutiesPerform, []], status = [uncomplete], routing = [executor], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{convert = any, type = any}
      }
    ]
  },

  #policy{
    api_endpoint = execute,
    combining    = any,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = #sequenceFlow{source = "gwIsSent", target = "Sent"}},
    rules        = [
      #rule{
        api_endpoint   = execute,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = executor_check,
        resource_match = any,
        object         = #object_executor{routing = [target], status = [uncomplete], type = <<"output">>}
      }
    ]
  },

% ---------------------- NOTIFY -----------------------------

  #policy{
    api_endpoint = notify,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = notify,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [], routing = [notify], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, needCert = false, certificate = false, type = template}
      }
    ]
  },

  #policy{
    api_endpoint = notify,
    combining    = all,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = #sequenceFlow{source = "gwIsSent", target = "Sent"}},
    rules        = [
      #rule{
        api_endpoint   = notify,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = executor_check,
        resource_match = any,
        object         = #object_executor{routing = [notify], status = [uncomplete], type = <<"output">>}
      }
    ]
  },

  #policy{
    api_endpoint = notify,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "ImplementationControl"},
    rules        = [
      #rule{
        api_endpoint   = notify,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [], routing = [notify], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, needCert = false, certificate = false, type = template}
      }
    ]
  },

% ---------------------- CONTROL -----------------------------

  #policy{
    api_endpoint = control,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "ImplementationControl"},
    rules        = [
      #rule{
        api_endpoint   = control,
        subject        = #subject_employee{roles = [controller], routing = [control_by], substitute_type = [delegat, tempDutiesPerform, []], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, needCert = false, certificate = false, type = template}
      }
    ]
  },

% ---------------------- EXECUTIONCANCEL -----------------------------

  #policy{
    api_endpoint = executionCancel,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = executionCancel,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [delegat, tempDutiesPerform, []], routing = [executor, subexecutors], status = [complete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, needCert = false, certificate = false, type = template}
      }
    ]
  },

  #policy{
    api_endpoint = executionCancel,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Executed"},
    rules        = [
      #rule{
        api_endpoint   = executionCancel,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [delegat, tempDutiesPerform, []], routing = [executor, subexecutors], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_file{sign = true, convert = finished, needCert = false, certificate = false, type = template}
      }
    ]
  },

  #policy{
    api_endpoint = executionCancel,
    combining    = all,
    object       = #object_process{module = 'Elixir.Send.Proc', stage = #sequenceFlow{source = "gwIsSent", target = "Sent"}},
    rules        = [
      #rule{
        api_endpoint   = executionCancel,
        subject        = #subject_employee{roles = [register], substitute_type = [], org = Default},
        type           = permit,
        subject_condition = employee_check,
        object_condition = executor_check,
        resource_match = any,
        object         = #object_executor{routing = [target], status = [complete], type = <<"output">>}
      }
    ]
  },

  #policy{
    api_endpoint = executionCancel,
    combining    = all,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Executed"},
    rules        = [
      #rule{
        api_endpoint   = executionCancel,
        subject        = #subject_employee{roles = [register, executor], routing = [executor], substitute_type = [delegat, tempDutiesPerform, []], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        object_condition = file_check,
        resource_match = any,
        object         = #object_file{convert = any, type = any}
      }
    ]
  },

% ---------------------- STATUSBUTTONS -----------------------------

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [initiator], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [initiator], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [executor, subexecutors, notify], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [executor, subexecutors, notify], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"}
      }
    ]
  },

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [to], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [to], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"}
      }
    ]
  },

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [to], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [to], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation"}
      }
    ]
  },

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [executor], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [executor], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"}
      }
    ]
  },

  #policy{
    api_endpoint = assistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"},
    rules        = [
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [notify], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"}
      },
      #rule{
        api_endpoint   = assistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [notify], status = [assistantProcessed], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [approvers], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [signatory], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [approvers], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [signatory], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [approvers], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [signatory], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [initiator], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [executor, subexecutors, notify], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [to], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [to], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [executor], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"}
      }
    ]
  },

  #policy{
    api_endpoint = removeAssistantProcessed,
    combining    = all,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"},
    rules        = [
      #rule{
        api_endpoint   = removeAssistantProcessed,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [notify], status = [assistantProcessed], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"}
      }
    ]
  }

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [approvers], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [signatory], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [initiator], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [initiator], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [executor, subexecutors, notify], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [executor, subexecutors, notify], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"}
      }
    ]
  },

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [to], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [to], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"}
      }
    ]
  },

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [to], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [to], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation"}
      }
    ]
  },

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [executor], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [executor], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"}
      }
    ]
  },

  #policy{
    api_endpoint = toAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"},
    rules        = [
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [notify], status = [uncomplete], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"}
      },
      #rule{
        api_endpoint   = toAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant], routing = [notify], status = [toAttention], org = Default},
        type           = deny,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [approvers], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [signatory], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOutput.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [approvers], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [signatory], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInternal.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [approvers], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "Agreement"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [signatory], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewOrg.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [initiator], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "SignatureImposition"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [executor, subexecutors, notify], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewResolution.Proc', stage = "Execution"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [to], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "InitialConsideration"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [to], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.NewInput.Proc', stage = "Implementation"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [executor], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Execution"}
      }
    ]
  },

  #policy{
    api_endpoint = removeToAttention,
    combining    = all,
    object       = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"},
    rules        = [
      #rule{
        api_endpoint   = removeToAttention,
        subject        = #subject_employee{roles = [register, executor], substitute_type = [assistant, []], routing = [notify], status = [toAttention], org = Default},
        type           = permit,
        subject_condition      = employee_check,
        resource_match = any,
        object         = #object_process{module = 'Elixir.AutoTask.Proc', stage = "Familiarization"}
      }
    ]
  }
].


boot() ->
  UserPolicy = kvs:index(policy, creator, user, #kvs{mod = kvs_mnesia}),
  UserRules = kvs:index(rule, creator, user, #kvs{mod = kvs_mnesia}),
  mnesia:clear_table(policy),
  mnesia:clear_table(rule),
  lists:foreach(fun (X) -> kvs:put(X, #kvs{mod = kvs_mnesia}) end, UserPolicy),
  lists:foreach(fun (X) -> kvs:put(X, #kvs{mod = kvs_mnesia}) end, UserRules),
  lists:foreach(fun (#policy{rules = R} = P) ->
    NewR =
      lists:map(fun (#rule{object = _O, resource_match = RM} = X) ->
        I = kvs:seq([], []),
        kvs:put(X#rule{id = I}, #kvs{mod = kvs_mnesia}),
        #rule_ref{id = I, resource_match = RM}
      end, R),
    kvs:put(P#policy{id = kvs:seq([], []), rules = NewR}, #kvs{mod = kvs_mnesia})
  end, policy(application:get_env(crm, active_org, "MIA:TEST"))).

