// Imports
#import "components/transfer_paper.typ": transfer_paper

#show: transfer_paper.with(
	language: "de",
  "1",
	"14867",
	"Warum gelingt es Unternehmen häufig nicht, agile Arbeitsweisen konsequent durchzusetzen, und welche Lösungsansätze können diese Umsetzung verbessern?",
	"Wirtschaftsinformatik, I25a",
	appendix_content: include "chapters/99_appendix.typ",
)

// --- Include content here ---
#include "chapters/01_chapter.typ"
#include "chapters/02_chapter.typ"
#include "chapters/03_chapter.typ"
