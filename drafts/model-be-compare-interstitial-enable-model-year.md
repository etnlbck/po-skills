---
project: LEXC
issue_type: Story
parent_epic: LEXC-38223
summary: Model | BE | Compare Interstitial | Enable model year on the module
labels:
  - Psyduck
  - T1-Platform
  - compare-interstitial
assignee_team: Psyduck
---

## Description

Add an Enable model year control to the Compare Interstitial Module tab. When it is on, each card's model year from LEXC-38630 is included in the component JSON. When it is off, that property is omitted from every card.

Done means an author can turn model year on or off for the whole module, and the component JSON follows that setting. This does not add the year field itself.

## Context

LEXC-38630 is already adding the per-card model year on the content dialog. Authors still need one module-level switch so a page can show or hide that year without editing every card. MVP still shows one year per card when the year is enabled (LEXC-38435). Multi-year selection stays in LEXC-38626.

Parent: LEXC-38223.

## Acceptance Criteria

```gherkin
Scenario: AC01 — Module tab has Enable model year
  Given the Compare Interstitial component dialog from LEXC-38224
  When an author opens the Module tab
  Then an Enable model year checkbox is on the Module tab
  And the checkbox is not on the card content dialog

Scenario: AC02 — Enabled module returns each authored card year
  Given Enable model year is checked
  And a card has a model year authored through LEXC-38630
  When the Compare Interstitial component JSON is requested
  Then that card's model year property equals the authored value

Scenario: AC03 — Disabled module omits model year
  Given Enable model year is unchecked
  And a card has a model year authored through LEXC-38630
  When the Compare Interstitial component JSON is requested
  Then the model year property is absent on every card

Scenario: AC04 — An empty card year stays absent while the module is enabled
  Given Enable model year is checked
  And one card's model year is empty
  And a second card has a model year authored through LEXC-38630
  When the Compare Interstitial component JSON is requested
  Then the empty card has no model year property
  And the second card's model year property equals its authored value

Scenario: AC05 — Build Model Select still omits model year
  Given a Build Model Select page
  When its component JSON is requested
  Then card JSON does not include a model year property
```

## Validation Context

Use one authored Compare Interstitial page with at least two cards: one with a model year, one with the year left empty. Compare the component JSON with Enable model year checked and unchecked. The model year property name is the one LEXC-38630 adds. Do not add a second year property.

Build check: a current Build Model Select page, which clears year before output.

## Out of Scope

- Adding or editing the per-card model year field. That is LEXC-38630.
- Choosing which year to show when a model has two live years.
- Multi-year selection inside a card. That is LEXC-38626.
- Rendering the year in the UI.
- Changing Build Model Select authoring or output.

## Open decisions

| Affected AC / case | Missing decision | Owner | Impact |
|---|---|---|---|
| Unset checkbox on pages authored before this field exists | Default when Enable model year has never been saved. Recommendation: unchecked, so existing pages do not start returning a year until an author turns it on. | Product | AC for the unset state cannot be executed |
| AC02–AC04 | JSON property name for the card year, owned by LEXC-38630 | BE (LEXC-38630) | These scenarios stay draft until that property name is on LEXC-38630 |

## Dependencies

- LEXC-38224 — Compare Interstitial component, dialog, Sling model, and JSON. In Review.
- LEXC-38630 — per-card model year field. In Progress. This story consumes that property. It does not define it.
