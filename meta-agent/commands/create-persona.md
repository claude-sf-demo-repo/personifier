---
description: Build a new world-class domain-expert persona through the persona-builder pipeline
argument-hint: [optional rough description; otherwise the pipeline will interview you]
---

You are starting the persona-builder pipeline. The user has invoked `/create-persona`
optionally followed by a rough description: "$ARGUMENTS".

Do this:

1. Spawn the `persona-builder` agent via the Task tool. Give it a self-contained prompt
   that includes:
   - The user's rough description (if any), quoted.
   - A reminder that it runs all 6 stages in order: interview, round 1 research,
     refinement, round 2 research, tool discovery + scaffolding, assembly + scheduling.
   - The instruction that it should come back to the user for Stage 1 (interview) and
     Stage 3 (refinement) in the main conversation — those stages are user-interactive,
     not delegation-only.
   - The project root: `/Users/abogdan/Desktop/projects/personifier`.

2. The persona-builder will take over. Step aside and let it run. Relay its questions
   to the user when it comes back to you. When it finishes, it will report:
   the persona slug, where files live, how to invoke, refresh cadence, and any deferred
   tool gaps. Pass that report through verbatim.

Do not try to run the pipeline yourself. The persona-builder has the full context.
