# Alere iOS MVP — Design

Status: approved for implementation planning  
Date: 2026-07-23

## Product definition

Alere is an evidence-based nutrition intelligence assistant. The first product
version is a native iOS application that helps a person choose one realistic
nutrition improvement, learn from the result, and understand patterns over
time.

The application is not a calorie tracker, food diary, diagnostic tool, or
replacement for qualified medical care. It should feel closer to an agent that
works with the user than to a collection of dashboards.

## MVP hypothesis

A person will return to Alere when it:

1. understands the person's current priority;
2. accepts incomplete, conversational context;
3. recommends one feasible next action;
4. remembers only context the person has approved;
5. turns accumulated interactions into a useful weekly synthesis.

The product begins directly as a native iOS MVP. A separate skill experiment is
not a prerequisite.

## Audience

The initial audience is generally healthy adults who want to improve ordinary
weekday eating without counting every calorie. They need practical help in the
moment and useful reflection across the week.

The launch language is English for a global adult audience. Russian-speaking
users in Poland remain the first planned localization: that version uses metric
units, Polish złoty, local seasonality, and products realistically available in
Poland.

## Core experience

### Onboarding

The onboarding asks one primary question:

> What would you like to improve first?

The user can select one suggested goal, write a custom goal, or skip:

- eat more balanced meals;
- feel more consistent energy;
- simplify everyday food choices;
- manage weight without calorie counting;
- custom goal;
- not sure yet.

The goal is optional, editable, and never treated as a medical outcome or rigid
score. Its purpose is to prioritize advice, prompts, and weekly synthesis.

### Main screen

The application has one primary screen and no tab bar. It contains:

- the current goal or focus;
- a short list of context-sensitive starter prompts;
- the conversation timeline;
- a text composer with voice input;
- the current proposed action, when one exists;
- access to the latest weekly synthesis.

Goals, memory, sources, privacy, and previous weekly summaries open through
progressive disclosure rather than permanent top-level navigation.

### Conversation

Users describe a meal, choice, difficulty, preference, or question using text
or voice. Alere may ask the minimum clarifying question needed, then provides:

1. a concise practical conclusion;
2. one prioritized next action;
3. brief reasoning;
4. alternatives when constraints make the first action impractical;
5. uncertainty or safety boundaries where relevant.

Responses must follow the behavior and evidence rules in `skill/SKILL.md`
without embedding product implementation details into the skill.

### Suggested prompts

Prompts reduce blank-screen friction and adapt to available context. Initial
categories include:

- help me choose what to eat now;
- compare two grocery options;
- adapt a recipe to what I have;
- plan a simple meal or shopping list;
- review how today is going;
- suggest one easy improvement;
- help with a recurring difficulty;
- show what you noticed this week.

They are conversation starters, not separate tools or navigation destinations.

### Actions and feedback

Alere can propose one active action at a time. The user can:

- accept it;
- adjust it;
- decline it;
- later mark whether it was attempted and useful.

This feedback influences future recommendations. There are no streaks, food
grades, guilt-inducing states, or mandatory daily completion.

### User-approved memory

Potentially useful persistent context is not saved silently. Alere shows the
proposed memory in plain language and lets the user confirm, edit, or reject it.
The user can later view and delete every saved item.

Examples include dietary preferences, recurring constraints, accepted goals,
and whether a previous suggestion was feasible. Sensitive medical inferences
must not be created from casual conversation.

The complete set of supported conversational situations and context boundaries
is defined in `docs/assistant-capabilities.md`.

### Weekly synthesis

The weekly synthesis works with incomplete history. It contains:

- what appears to be working;
- one meaningful pattern;
- one next focus;
- a brief explanation of uncertainty when observations are sparse.

It must not pretend to provide nutritional completeness, exact intake, or a
clinical assessment.

## Native iOS integration

The MVP uses iOS capabilities only when they shorten the core loop:

- App Intents for asking Alere, starting food-choice help, and opening the
  weekly synthesis;
- Siri and Shortcuts through those intents;
- Action Button and Control Center availability where supported by App Intents;
- native dictation or speech transcription for voice input;
- Foundation Models for suitable on-device tasks when available.

The application remains usable when Apple Intelligence is unavailable. A
single assistant client selects between supported on-device processing and a
server fallback without exposing provider details to feature code.

## Architecture

Use the same high-level organization as the Drafts project: a thin Xcode
application target around a flat local Swift package.

```text
App/
└── iOS/

Sources/
├── AppFeature/
├── OnboardingFeature/
├── AssistantFeature/
├── Model/
├── AssistantClient/
├── AppIntents/
├── Resources/
└── SharedUI/

Tests/
├── AppFeatureTests/
├── OnboardingFeatureTests/
├── AssistantFeatureTests/
├── ModelTests/
├── AssistantClientTests/
└── AppIntentsTests/
```

Responsibilities:

- `AppFeature`: application lifecycle and root presentation;
- `OnboardingFeature`: optional primary-goal selection;
- `AssistantFeature`: conversation, prompts, active action, feedback, and
  weekly synthesis presentation;
- `Model`: persistent records and database preparation;
- `AssistantClient`: model-provider selection and structured assistant
  operations;
- `AppIntents`: extension-safe system entry points;
- `Resources`: localized strings and generated resource access;
- `SharedUI`: only genuinely reused visual components.

Weekly synthesis stays inside `AssistantFeature` for the MVP. It becomes a
separate feature only when its behavior or interface grows independently.

## Technical foundation

- SwiftUI;
- Swift 6 with strict concurrency;
- The Composable Architecture;
- `swift-dependencies`;
- `sqlite-data`;
- `swift-tagged`;
- SwiftGen for localization and resources;
- Apple Foundation Models where available;
- one server AI provider behind `AssistantClient`.

Do not add libraries speculatively. Structured Queries, analytics, purchases,
CloudKit, and a custom SDK are added only when an implemented requirement needs
them.

## Data flow

1. The user submits text or transcribed speech.
2. `AssistantFeature` loads the current goal, confirmed memory, recent
   conversation, and active action.
3. `AssistantClient` receives the minimum required structured context.
4. The client returns structured output separating the user-facing response,
   proposed action, proposed memories, source needs, and safety route.
5. The feature displays the response and asks for confirmation before saving
   actions or memory.
6. Confirmed data is persisted locally.
7. Weekly synthesis reads confirmed interactions and feedback, then produces a
   bounded summary that exposes uncertainty.

## Failure handling

- Preserve the user's unsent or failed message.
- Explain offline and provider failures in plain language and allow retry.
- Never silently switch to a response mode with weaker safety guarantees.
- Treat unsupported Foundation Models availability as a normal fallback case.
- If voice transcription fails, keep the text composer available.
- Never fabricate a weekly synthesis when history is insufficient.
- Higher-risk nutrition requests follow the safety routing defined by the
  skill.

## Privacy

- Local-first storage for goals, conversations, actions, feedback, and memory.
- Explicit confirmation before durable memory is created.
- Clear deletion of individual memories and all local data.
- Send only the minimum context required to a server fallback.
- No HealthKit permission, account, cloud synchronization, or analytics in the
  first version.

## Testing

The MVP requires:

- reducer tests for onboarding, conversation, action feedback, memory
  confirmation, and weekly synthesis states;
- database tests for persistence and deletion;
- assistant-client contract tests using deterministic responses;
- fallback routing tests for Foundation Models availability;
- App Intent tests for supported entry points;
- safety fixtures for high-risk requests;
- accessibility checks for VoiceOver, Dynamic Type, Reduce Motion, and minimum
  touch targets;
- an iOS simulator build of the real application scheme.

AI output quality evaluation is separate from deterministic unit tests. Maintain
a small versioned set of representative conversations and review relevance,
feasibility, evidence handling, safety, and consistency after prompt or provider
changes.

## Explicitly deferred

- food photography and image analysis;
- Share Sheet;
- HealthKit;
- widgets and Live Activities;
- barcode scanning and food databases;
- exact calorie tracking;
- CloudKit and account synchronization;
- social features;
- laboratory-result interpretation;
- therapeutic plans;
- watchOS and Android applications.

The architecture may leave clean seams for these capabilities, but the MVP must
not contain empty modules or placeholder UI for them.

## MVP success

The first version succeeds as a product prototype when a user can:

1. begin without a lengthy questionnaire;
2. obtain a relevant first action from a short conversation;
3. confirm or reject what Alere remembers;
4. report whether the action was useful;
5. receive a useful, appropriately uncertain weekly synthesis;
6. access the main loop through native system entry points.
