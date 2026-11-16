---
project: LEXC
issue_type: Story
parent_epic: LEXC-38223
summary: Model | BE | Compare Interstitial | Add a component-level CTA template
labels:
  - Psyduck
  - T1-Platform
  - compare-interstitial
assignee_team: Psyduck
---

## Description

Add the shared CTA template to the Compare Interstitial component dialog, once for the component. Authored CTA values are returned as one `cta` object on the component JSON, using the existing CTA model. The CTA is not authored per card and is not a field on the Compare Model Page fragment.

Done means an author can set the CTA from the component dialog and see those values on `cta` in the component JSON. An empty CTA does not invent a label or a Compare URL.

## Context

The shared template is the CTA dialog other LCOM components include (`lexus/components/shared/cta`): type, text, aria label, link, target, theme, disabled, breakpoints, interstitial behavior, and CTA content-fragment path. LEXC-38224 already sets Compare destination and overlay ID once on the component, and each card still carries `compareTrimCode`. This story adds the CTA template beside that handoff. It does not replace it.

Parent: LEXC-38223.

## Acceptance Criteria

```gherkin
Scenario: AC01 — Component dialog includes the shared CTA template
  Given the Compare Interstitial component dialog from LEXC-38224
  When an author opens the component dialog
  Then the shared CTA template fields are present once on the component
  And those fields are not on the Module tab's card content
  And those fields are not repeated per card

Scenario: AC02 — Authored CTA values are returned on the component
  Given an author has set CTA type, text, aria label, link, target, and theme
  When the Compare Interstitial component JSON is requested
  Then cta.type, cta.text, cta.ariaLabel, cta.href, cta.target, and cta.theme equal the authored values
  And cta is not inside a card

Scenario: AC03 — An empty CTA does not invent a label or Compare URL
  Given CTA text and link are empty
  When the Compare Interstitial component JSON is requested
  Then cta.text and cta.href are empty or absent
  And neither property is filled with a Select label or a Compare destination URL

Scenario: AC04 — Compare handoff fields stay as they are
  Given a Compare Interstitial page authored with a destination, an overlay ID, and a card compareTrimCode
  When the component JSON is requested after the CTA template is added
  Then destination and overlay ID are still returned once on the component
  And compareTrimCode is still returned on the card
```

## Validation Context

Author one Compare Interstitial page. Set type `button`, text `Select`, aria label `Select RX`, link `/compare`, target `_self`, and theme from the button theme list. Confirm those values on the component-level `cta` object.

Then clear text and link and request the JSON again. `cta.text` and `cta.href` must be empty or absent.

Confirm destination, overlay ID, and `compareTrimCode` still match the page authored for LEXC-38224.

## Out of Scope

- Rendering the CTA. UI consumes `cta`.
- A CTA on each card, or a CTA list.
- Replacing destination, overlay ID, or `compareTrimCode` with the CTA link.
- Building the per-card Compare URL.
- Analytics on the CTA.

## Open decisions

| Affected AC / case | Missing decision | Owner | Impact |
|---|---|---|---|
| AC02 | Whether this CTA is the card Select action, or a separate component CTA beside the Select handoff. Recommendation: a separate component-level CTA. The Select handoff stays destination + overlay ID + compareTrimCode, because one authored link cannot vary by card. | Product | If this CTA is the Select button, AC03 and AC04 have to be rewritten before the story is ready |
| Unset CTA on existing pages | Confirm an empty `cta` is acceptable for pages authored before this field exists, with no default text or link. | Product | Needed before calling existing pages backward compatible |
