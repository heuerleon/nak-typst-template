// Imports
#import "components/transfer_paper.typ": transfer_paper

// Language is globally defined in `transfer_paper.typ`. Defaults to English

#show: transfer_paper.with(
  "1",
	"12345",
	"Ein wundervoller und deskriptiver, aber nicht zu langer Titel, aber immerhin füllt er zwei Zeilen",
	"Angewandte Informatik, A22b",
	appendix_content: include "chapters/99_appendix.typ",
)

// --- Include content here ---
#include "chapters/01_chapter.typ"
#include "chapters/02_chapter.typ"
#include "chapters/03_chapter.typ"
