// AI process documentation
//
// To add a new row to the appendix table, just append another `(...)`
// block to the list below. The fields are:
//
//   date      – Date the AI was queried, in `YYYY-MM-DD` format.
//               The renderer formats it as `(DD.MM.YYYY)` and appends
//               it to the query. Required.
//   query     – The query sent to the AI (the date of access is
//               appended automatically from the `date` field, so do
//               NOT include the date in `query` yourself)
//   reason    – Why the AI was used. Required.
//   quality   – Assessment of the AI's output quality. Required.
//   software  – Software and version used. Required.
//
// All fields are required — a missing or empty value will fail the
// compile with a clear error message pointing at the offending entry.

#let ai_documentation_entries = (
  (
    date: "2026-06-08",
    query: "This is an example prompt that will have the date above appended to it automatically. The date field is required and must be in YYYY-MM-DD format.",
    reason: "Demonstration of the AI documentation table formatting and validation.",
    quality: "Excellent; Didn't need any follow-up prompts or corrections.",
    software: "Claude Opus 4.8",
  ),
)
