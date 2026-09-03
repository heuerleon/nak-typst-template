#import "components/transfer_paper.typ": transfer_paper
#import "const.typ": language

#show: transfer_paper.with(
	language: language,
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
