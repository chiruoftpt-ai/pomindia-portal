# POMIndia Portal: Intent

> Status: DRAFT template, derived from the original portal overview (Use Case 1 only) and the idea validation notes. Items marked **[CONFIRM]** are drafted assumptions for the founder to accept or change. Items marked **[TBD]** have no answer yet.

## 1. Purpose

POMIndia (PeaceOfMindIndia) gives people who live abroad confidence about the vacant land they own in India. A trusted local agent visits the plot, captures dated photos, video and notes, and the owner sees verified results in a web portal, without relying on relatives or phone calls.

**Scope of this product: vacant land monitoring only.** Residential and commercial rental monitoring (original Use Cases 2 and 3) are out of scope and are not designed for here. See section 8.

## 2. The problem

- Owners abroad (often of inherited land) cannot see their plot, so they cannot tell whether it is encroached on, dumped on, fenced, built on, or sold fraudulently.
- Current substitutes are weak: relatives and WhatsApp photos, informal local contacts, and satellite imagery with no ground truth.
- Trust is the product. Photos alone have low value unless the owner can believe they are real, recent and taken at the right place.

## 3. Users and roles

| Role | Who | What they need |
|---|---|---|
| Owner | Landowner living outside India (primary market: US) | Register land, request a visit, see verified photos, location and notes, get alerts |
| Agent | POMIndia field agent in India | See assigned visits, capture photos and notes on a phone, submit even with poor connectivity |
| Admin / QA | POMIndia staff | Manage agents and visits, review submissions before release, view audit history |
| Validator | Person testing the app with real feedback | Use the staging site and report problems |

Whether property management companies are users at launch: **[TBD]**. The original overview listed them; this draft leaves them out of v1.

## 4. The service in one flow

1. The owner signs in (Google via Auth0) and registers a plot: address, survey or registration number, and a boundary or point on the map.
2. The owner requests a visit, or a recurring schedule.
3. An agent is assigned and visits the plot. They capture photos and video in the app, tap boundary corners if asked, and add notes on surroundings and any observed valuation signals.
4. Admin / QA checks the submission before it becomes visible.
5. The owner sees the report: dated media on the map, agent notes, and the visit history.

## 5. Principles

1. **Evidence is a claim until verified.** Photo EXIF location is supporting evidence only. In-app capture with live device location and a user-drawn boundary are the primary location records.
2. **Quality gate before release.** Nothing reaches an owner until QA validates it.
3. **Privacy by default.** The app holds names, addresses, emails, phones and land ownership details. Follow the rules in `CLAUDE.md`: no PII in logs, prompts or the repository; strip EXIF location from displayed images; synthetic data outside production.
4. **Do not build what vendors do better.** Use Auth0 for authentication and Google Maps Platform for maps.
5. **Mobile-ready architecture.** Keep the backend as discrete services so a mobile app can follow.
6. **One unique ID per property.** An owner can have many properties.

## 6. Scope

### In scope for v1 (vacant land)
- Owner registration, sign-in with Google, profile
- Add and manage plots (multiple per owner), each with a unique ID
- Map view of a plot on Google satellite imagery; owner-drawn or agent-walked boundary
- Visit requests and an agent to-do list ordered by date and address
- Agent capture of photos, video and notes (phone, works with weak connectivity)
- Admin: manage agents, assign visits, QA review, audit trail of who changed what and when
- Owner view of released reports
- Reports by state, city and PIN code with a print-friendly view; CSV export for admins
- Initial geography: Andhra Pradesh, Maharashtra, Karnataka **[CONFIRM]**
- Freemium model: what is free versus paid is **[TBD]**

### Out of scope for v1
- Residential and commercial rental monitoring (original Use Cases 2 and 3)
- Rent collection and any payments (payments come later, after the monitoring service works)
- Buying, selling, fencing, legal action or other value-added services (designed for later modules)
- Integration with state land-record systems. In v1 owners enter survey numbers and documents; admins verify manually.
- Satellite change detection (a candidate later feature)
- A native mobile app

## 7. Success measures

Targets are placeholders until the founder sets them. **[TBD]**

| Measure | Target |
|---|---|
| Paying owners who renew after the first period | [TBD] |
| Visits completed on time | [TBD] |
| Reports rejected by QA (quality of agent work) | [TBD] |
| Time from visit to owner seeing the report | [TBD] |
| Owner satisfaction in validation interviews | [TBD] |

## 8. Constraints and assumptions

- Owners are in the US; agents are in India. Hosting in the US is acceptable.
- Stack decisions: Python 3.13 and FastAPI on Render, Postgres with PostGIS, frontend on Netlify, Auth0, Google Maps Platform. Other choices are recorded in `docs/adr/` once they exist.
- Solo builder working with AI agents, plus one person for user validation.
- Legal limits on foreign ownership of Indian agricultural land, privacy obligations and the terms of use for land-record data are not yet reviewed by counsel. **[TBD]**
- Original design guidelines carried forward: strong password hashing and lockout are delegated to Auth0 policies; user-friendly error messages; exceptions logged without PII.

## 9. Open questions

1. What is free and what is paid in the freemium model?
2. Who are the first agents, and how are they vetted and paid?
3. What happens when an agent's report is false or the land is lost? Where does liability sit?
4. Does the service stop at reporting, or does it help with encroachment (legal and police follow-up)?
5. Which survey or record details must be collected for each of the three launch states?
6. How long are photos and videos kept, and who may delete them?
7. Are property management companies users in v1?
8. What do the 20-30 owner interviews say about willingness to pay?

## 10. How this document is used

- Every feature spec in `docs/specs/` must trace back to this intent.
- Agents read this file before starting work (see `CLAUDE.md`).
- Changes to scope or principles go through a pull request and the founder's approval.
