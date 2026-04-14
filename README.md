ABAC: Attribute Based Access Control (ISO/IEC 29146)
====================================================

[![Actions Status](https://github.com/erpuno/abac/workflows/mix/badge.svg)](https://github.com/erpuno/abac/actions)
[![Hex pm](https://img.shields.io/hexpm/v/abac.svg?style=flat)](https://hex.pm/packages/abac)

Дана бібліотека реалізує систему керування доступом на основі атрибутів (**ABAC**) згідно з міжнародним стандартом **ISO/IEC 29146:2016** (Information technology — Security techniques — A framework for access management) та рекомендаціями **NIST SP 800-162**.

## Архітектура (ISO 29146)

Відповідно до стандарту, система розділена на функціональні компоненти:

1.  **PDP (Policy Decision Point)** — Точка прийняття рішень (`ABAC.PDP`). Обчислює вердикт (Permit/Deny) на основі політик та атрибутів.
2.  **PIP (Policy Information Point)** — Точка інформації про політики (`ABAC.PIP`). Збагачує запит атрибутами з контексту (ERP, BPE, бази даних).
3.  **PAP (Policy Administration Point)** — Точка адміністрування. Забезпечує створення та зберігання політик (використовує `KVS`).
4.  **PEP (Policy Enforcement Point)** — Точка забезпечення виконання (`ABAC.API`). Перехоплює запити до системи та викликає PDP для отримання дозволу.

## Модель даних

### Запит (Request)
Запит на доступ описується записом `request`, що містить:
*   `subject`: Суб'єкт (користувач, сервіс, ERP Employee).
*   `endpoint`: API-метод або дія (напр. `VIEW`, `EDIT`, `SIGN`).
*   `context`: Додаткові дані оточення (форми, файли, процеси).

### Політики та Правила
*   **Policy**: Група правил з алгоритмом комбінування (`all` — логічне "І", `any` — логічне "АБО").
*   **Rule**: Атомарна перевірка, що включає:
    *   `subject_condition`: Умови для суб'єкта (функція перевірки ролей, посад).
    *   `object_condition`: Умови для об'єкта (функція перевірки стадій, файлів).
    *   `type`: Тип правила (`auth` для дозволу, `deny` для заборони).

## Імплементація об'єктів

Для державного проєкту реалізовано підтримку специфічних об'єктів:
*   **Співробітник (`subject_employee`)**: Перевірка ролей, підрозділів (org/branch) та делегованих повноважень (assistant/delegate).
*   **Процес (`object_process`)**: Перевірка стадії бізнес-процесу (BPE) та його статусу.
*   **Документ (`object_file`)**: Атрибути ЕЦП (sign), необхідність сертифікації (needCert), тип документа.
*   **Форма (`object_form`)**: Ідентифікатори та доступні поля.

## Приклади (для розробників)

Дозвіл на підписання документа лише для користувачів з роллю `BOSS` на стадії процесу `AGREEMENT`:

```erlang
 Rule = #rule{
    id = <<"sign_boss_rule">>,
    api_endpoint = 'SIGN',
    type = auth,
    subject_condition = employee_check,
    subject = #subject_employee{roles = ['BOSS']},
    object_condition = sched_check,
    object = #object_process{stage = 'AGREEMENT'}
 }.

 Policy = #policy{
    id = <<"gov_sign_policy">>,
    combining = all,
    rules = [#rule_ref{id = <<"sign_boss_rule">>}]
 }.
```

## Стандарти та відповідність

*   **ISO/IEC 29146:2016** — Архітектурний фреймворк та термінологія.
*   **NIST SP 800-162** — Настанови з впровадження ABAC.
*   **XACML 3.0** — Логіка обробки (Permit/Deny/NotApplicable/Indeterminate).

Автор
-----

Максим Сохацький, Інформаційні Судові Системи
