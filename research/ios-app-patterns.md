# iOS App Development Patterns: AI-Human Collaboration Case Study

**Project:** Claw AI Chat (Feb 15 - Mar 5, 2026)
**Outcome:** Published iOS app, €1.99, App Store approved

---

## Pattern 1: Start Web, Pivot Native on Platform Limits

**Timeline:** Feb 15, 2026

Started with PWA (Progressive Web App) approach:
- Fast to build (~1 day)
- Cross-platform by default
- No App Store friction

**Pivot trigger:** WebKit keyboard accessory bar cannot be removed. User found it annoying. Native iOS gives full control over keyboard behavior.

**Lesson:** Web-first is good default, but know when to abandon it. Platform constraints that frustrate users are worth pivoting for. Time spent on PWA wasn't wasted — protocol logic transferred to native.

**Thesis relevance:** AI agents can prototype quickly, but require human feedback on UX quality. The "annoying keyboard bar" observation came from human testing, not AI evaluation. Agent lacked ability to assess native mobile feel.

---

## Pattern 2: AI Writes, Human Builds

**Development model:**
1. AI (Therin) writes Swift code on Linux server
2. Human copies to Mac, builds in Xcode
3. Human tests on physical device
4. Feedback loop → AI adjusts code

**Constraints that shaped this:**
- AI has no access to Xcode (requires macOS)
- AI cannot run iOS simulator
- AI cannot sign or deploy to TestFlight
- Human controls the App Store submission

**What AI could do well:**
- Swift syntax and patterns
- SwiftUI view composition
- WebSocket client implementation
- Architecture decisions

**What AI couldn't evaluate:**
- Does the animation feel smooth?
- Is the keyboard behavior natural?
- Does the app feel "iOS-native"?

**Thesis relevance:** Clear capability boundary. AI handled code generation; human handled subjective quality assessment and platform-locked tooling. Neither could do the other's job efficiently.

---

## Pattern 3: App Store Iteration Loop

**Timeline:**
- Feb 17: First submission
- Feb 20: Review rejection (guidance issue)
- Feb 26-28: UX improvements, v1.3.0
- Mar 5: Approved

**Rejection handling:**
- AI drafted response to reviewer questions
- Human submitted through App Store Connect
- Multiple rounds before approval

**Lesson:** App Store review is adversarial collaboration. Reviews surface real issues (privacy, UX, safety) but communication is constrained. AI can help craft responses but human must interpret Apple's often-vague feedback.

---

## Pattern 4: Parallel Development Tracks

**Two tracks emerged:**
1. **Dev track:** Xcode direct install for daily testing
2. **Distribution track:** App Store for non-developer users

Siim used Xcode direct install for all development — no review gauntlet. App Store submission was optional, for broader distribution.

**Lesson:** Decouple development velocity from distribution approval. Don't let App Store review block your iteration speed.

---

## Pattern 5: Glassmorphic Design Session

**Feb 27:** Intensive UI design iteration

AI and human collaborated on visual design:
- AI proposed SwiftUI view structures
- Human evaluated "feel" in simulator/device
- Rapid iteration (~30 min session)

**Outcome:** v1.3.0 with improved UX, ready for final submission

**Thesis relevance:** Design is evaluable only through rendering. AI can propose, but human must see and feel. This is different from backend code where AI can reason about correctness.

---

## Trust Equation Application

Using thesis Trust Framework: `Trust = (Observability × Reversibility × Blast Radius) / Autonomy`

| Aspect | Value | Notes |
|--------|-------|-------|
| Observability | High | All code written as files, human reviews every change |
| Reversibility | High | Git history, can always revert |
| Blast Radius | Low | Private app, internal use first |
| Autonomy | Medium | AI writes, human gates deployment |

**Result:** High trust scenario. AI could operate with significant autonomy because all three safety factors were strong.

---

## Files Changed

- `memory/2026-02-15.md` — Initial PWA + native scaffold
- `memory/2026-02-17.md` — App Store submission
- `memory/2026-02-20.md` — Review rejection handling
- `memory/2026-02-27.md` — Glassmorphic design session
- `memory/2026-03-05.md` — Approval and launch

---

*Documented: 2026-04-01 by Therin, as thesis evidence for AI-human collaboration patterns*
