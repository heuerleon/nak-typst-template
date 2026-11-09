#let navy = rgb("#002060")
#let form_font = ("Calibri", "Carlito")
#let form_line_height = 15.82pt
#let form_box_pad = 5.4pt

#let form_base(body) = {
  set text(
    font: form_font,
    size: 12pt,
    lang: "de",
    hyphenate: false,
    kerning: false,
    top-edge: "ascender",
    bottom-edge: "descender",
  )
  set par(
    justification-limits: (spacing: (min: 100%, max: 150%), tracking: (min: -0.02em, max: 0em)),
    linebreaks: "optimized",
    justify: false,
    leading: form_line_height - 12pt,
    spacing: 8pt + form_line_height - 12pt,
  )
  set block(spacing: 0pt)
  body
}

#let fixed_lines(..lines, justify: true) = {
  let ls = lines.pos()
  for (i, l) in ls.enumerate() {
    l
    if i < ls.len() - 1 { linebreak(justify: justify) }
  }
}

#let plain(it) = {
  if it == none { "" }
  else if type(it) == str { it }
  else if type(it) != content { str(it) }
  else if it.has("text") { it.text }
  else if it.has("children") { it.children.map(plain).fold("", (a, b) => a + b) }
  else if it.has("body") { plain(it.body) }
  else if it.func() in (linebreak, parbreak) or repr(it) == "[ ]" { " " }
  else { "" }
}

#let form_box(header, body, header_h: 28.6pt, body_h: 117.7pt, width: 100%, header_top: 2.7pt) = block(
  width: width,
  breakable: false,
  {
    set block(spacing: 0pt)
    [#metadata((frage: plain(header), antwort: plain(body))) <form-box>]
    block(
      width: 100%,
      height: header_h,
      fill: navy,
      stroke: 0.5pt + black,
      inset: (x: form_box_pad, top: header_top),
      {
        set par(leading: 14.62pt - 12pt)
        text(fill: white, header)
      },
    )
    layout(size => {
      let m = measure(width: size.width - 2 * form_box_pad, body)
      block(
        width: 100%,
        height: calc.max(body_h, m.height + 2 * form_box_pad),
        stroke: (left: 0.5pt, right: 0.5pt, bottom: 0.5pt),
        inset: form_box_pad,
        body,
      )
    })
  },
)

#let form_field(value, underscores: 28) = if value == none or value == "" {
  [#("_" * underscores)]
} else {
  value
}

#let _hl(body) = text(weight: "bold", fill: navy, body)

#let auftragsklaerung(
  matnr: "",
  thema: [],
  technischer_fokus: [nicht zutreffend],
  anlass: [],
  arbeitssituation: [],
  ziel: [],
  vorgehen: [],
  freigabe: "",
) = {
  set page(
    paper: "a4",
    margin: (x: 70.87pt, top: 0pt, bottom: 56.7pt),
    background: place(
      top + left,
      dx: 385.89pt,
      dy: 30.99pt,
      image("../res/forms/nak_logo_auftrag.png", width: 179.05pt),
    ),
  )
  show: form_base

  v(74.1pt)
  text(size: 16pt, weight: "bold", fill: navy)[Auftragsklärung Transferleistungen Theorie/Praxis]
  v(0.4pt)
  [Matrikelnummer: #form_field(matnr)]
  par(justify: true, fixed_lines(
    [Da Sie eine Fragestellung bzw. eine Problemlösung für Ihr Unternehmen anstreben, ist eine],
    [umfangreiche Auftragsklärung unabdingbar und hat drei wesentliche Ziele:],
  ))
  v(11.82pt)
  {
    let item(..lines) = grid(
      columns: (18pt, 1fr),
      text(font: ("Segoe UI Symbol", "Noto Sans Symbols 2", "DejaVu Sans"), size: 10pt)[✓],
      par(justify: true, fixed_lines(..lines)),
    )
    pad(left: 18pt, {
      item(
        [#_hl[Sie] haben von Beginn an ein klares Bild, was die Anforderungen Ihres Unternehmens],
        [an Ihre Transferleistung sind,],
      )
      v(3.82pt)
      item(
        [#_hl[die betrieblichen Betreuer:innen Ihrer Unternehmen] wissen, welchen Output und],
        [somit Mehrwert sie von Ihnen durch die Transferleistung erwarten können,],
      )
      v(3.82pt)
      item(
        [#_hl[die NORDAKADEMIE] kann überprüfen, ob Ihr gewähltes Thema in sich konsistent],
        [erscheint, realistisch vom Umfang ist und ob Sie dies mit gewählten Mitteln erfolgreich],
        [bearbeiten können.],
      )
    })
  }
  v(30.22pt)
  [Bitte beantworten Sie die Fragen gemeinsam mit Ihrem betrieblichen Betreuer:innen. \
    Insgesamt stehen Ihnen als Richtwert 3000 Zeichen zur Verfügung.]
  v(33.42pt)

  form_box(
    [Wie lautet Ihr Thema (die betriebliche Fragestellung/das betriebliche Problem)?],
    thema,
    header_h: 28.6pt,
    body_h: 117.7pt,
  )
  v(19.1pt)
  form_box(
    [Worin besteht der technische Fokus? Wie wird der technische Bereich abgedeckt?\*#super[1] \
      #emph[Orientieren Sie sich an den Hinweisen „Verflechtung mit betrieblicher Praxis“ in den jeweiligen Modulbeschreibungen.]],
    technischer_fokus,
    header_h: 44.4pt,
    body_h: 138.6pt,
  )
  place(
    bottom + left,
    dy: -0.3pt,
    {
      line(length: 143.8pt, stroke: 0.72pt)
      v(3pt)
      set par(leading: 2.1pt)
      text(size: 10pt)[\*Nur auszufüllen für Transferleistungen mit technischem Fokus (vier Transferleistungen) im Studiengang \
        Wirtschaftsingenieurwesen ab Jg. 2024.]
    },
  )

  pagebreak()
  v(89.5pt)
  form_box(
    [Was ist der Anlass für die Fragestellung bzw. das Problem? \
      #emph[Wie wurde ich oder mein betrieblicher Betreuer auf das Problem aufmerksam und was wurde ggf. schon unternommen?]],
    anlass,
    header_h: 44.4pt,
    body_h: 143.1pt,
  )
  v(37.6pt)
  form_box(
    [Wie stellt sich die Fragestellung bzw. das Problem konkret in der Arbeitssituation dar? \
      #emph[Was bedeutet es, die Fragestellung bzw. das Problem noch nicht beantwortet bzw. gelöst zu haben?]],
    arbeitssituation,
    header_h: 44.3pt,
    body_h: 151.9pt,
  )
  v(37.7pt)
  form_box(
    [Was ist das Ziel der Transferleistung?],
    ziel,
    header_h: 28.6pt,
    body_h: 160.2pt,
  )

  pagebreak()
  v(70.9pt)
  form_box(
    [Wie ist das Vorgehen bei der Beantwortung der Fragestellung/des Problems geplant? \
      #emph[Mit welchen Methoden/Materialien will ich dies herausfinden/belegen/prüfen? \
        Was will ich in meiner Transferleistung hauptsächlich tun: argumentieren? analysieren? vergleichen? interpretieren? prüfen?]],
    vorgehen,
    header_h: 59.1pt,
    body_h: 238.6pt,
  )
  v(43.6pt)
  par(justify: true, fixed_lines(
    [#box(width: 7.3pt)[#text(size: 10pt)[#sym.ballot]] Ich gebe das Thema hiermit frei und übernehme die Betreuung des Studierenden während],
    [der Erstellung der Transferleistung: #form_field(freigabe, underscores: 27)],
  ))
  v(11.8pt)
  pad(left: 177pt)[Unterschrift betriebl. Betreuer/in]
  v(80.6pt)
  par(justify: true, fixed_lines(
    [Im Anschluss laden Sie die Auftragsklärung im CIS hoch. Ob Ihre Fragestellung angenommen],
    [wurde, erfahren Sie innerhalb einer Woche (gerechnet an Werktagen). Wenn das Thema],
    [durch die NORDAKADEMIE angenommen wurde, startet der vierwöchige],
    [Bearbeitungszeitraum. Wird Ihre Transferleistung nicht angenommen, erhalten Sie eine],
    [Information über den Ablehnungsgrund und können die Fragestellung, z.B. mit einem anderen],
    [Schwerpunkt oder einem anderen geplanten Vorgehen, erneut hochladen. Dieser Prozess],
    [kann sich ggf. mehrmals wiederholen, bis die Fragestellung angenommen wurde. Sofern Sie],
    [sich für ein technisches Modul angemeldet haben, beachten Sie, dass ein technischer Fokus],
    [gewährleistet sein muss. Rein wirtschaftlich betrachtete Themen können in diesem Modul],
    [nicht bewertet werden und können zu einem Fehlversuch führen.],
  ))
}

#let selbstreflexion(
  matnr: "",
  thema: "",
  kernfragen: [],
  ziel: [],
  studium: [],
  informationen: [],
  vorgehen: [],
  eigenleistung: [],
  gelernt: [],
) = {
  set page(
    paper: "a4",
    margin: (x: 70.87pt, top: 0pt, bottom: 56.7pt),
    background: {
      place(top + left, dx: 108.23pt, dy: 60.57pt, image("../res/forms/reflexion_linie.png", width: 453.4pt, height: 5.34pt))
      place(top + left, dx: 57.28pt, dy: 10.38pt, image("../res/forms/reflexion_tl_logo.png", width: 199.1pt, height: 52.6pt))
      place(top + left, dx: 327.55pt, dy: 24.0pt, image("../res/forms/reflexion_nak_logo.png", width: 235.0pt, height: 30.8pt))
    },
  )
  show: form_base

  v(74.2pt)
  text(size: 16pt, weight: "bold", fill: navy)[Selbstreflexion Transferleistung Theorie/Praxis\*]
  v(32.9pt)
  grid(
    columns: (117pt, 1fr),
    row-gutter: 12pt,
    [Matrikelnummer:], form_field(matnr, underscores: 56),
    [Freigegebenes Thema \ der Transferleistung:], grid.cell(align: bottom, form_field(thema, underscores: 56)),
  )
  v(27.6pt)
  par(justify: true, fixed_lines(
    [Diese Fragen dienen Ihnen zur Selbstreflexion und als Unterstützung bei der Erstellung Ihrer],
    [Transferleistung. Wir empfehlen Ihnen, sich vor, während und nach der Erstellung der],
    [Transferleistung immer wieder diese Fragen zu stellen um auf diesem Wege eine],
    [wissenschaftlich fundierte Transferleistung auszuarbeiten. Bitte beantworten Sie die Fragen],
    [mit ein bis zwei Sätzen (möglich sind auch Aufzählungen) und verweisen zudem auf das],
    [dazugehörige Kapitel in Ihrer Transferleistung. Im Gegensatz zu Ihrer Transferleistung und],
    [Auftragsklärung ist im Rahmen der Selbstreflexion die Ich-Form erwünscht. Die Abgabe der],
    [ausgefüllten Selbstreflexion ist Bestandteil Ihrer Transferleistung und fließt in die Bewertung],
    [dieser ein.],
  ))
  v(0pt)
  [Für die Beantwortung der Fragen stehen Ihnen als Richtwert 2000 Zeichen (ohne \ Leerzeichen) zur Verfügung.]
  v(9.7pt)

  form_box(
    [Was sind die Kernfragen meines Themas?],
    kernfragen,
    header_h: 29.7pt,
    body_h: 115.4pt,
    width: 459.5pt,
    header_top: 3.3pt,
  )
  v(24.3pt)
  form_box(
    [Welches Ziel möchte ich mit der Erstellung der Transferleistung erreichen und in welchem Ausmaß ist mir das am Ende gelungen?],
    ziel,
    header_h: 29.7pt,
    body_h: 130.0pt,
    width: 461.1pt,
    header_top: 3.3pt,
  )
  place(
    bottom + left,
    dy: -31.2pt,
    block(width: 433.7pt, {
      set par(leading: 11.05pt - 9pt)
      set text(size: 9pt, style: "italic")
      par(justify: true, fixed_lines(
        [\* Studierende, die unter den Anwendungsbereich der PVO bis 03.02.2015 fallen, fertigen Transferleistungen weiterhin in],
        [der Form von Praxisberichten an und der Begriff hält Einzug in das Abschlusszeugnis. Ab dem Jahrgang 2016 hat der],
        [Begriff vollumfängliche Gültigkeit. In der Kommunikation hält der Begriff Transferleistungen ab sofort Einzug.],
      ))
    }),
  )

  pagebreak()
  v(70.9pt)
  form_box(
    [Wie ist die Verbindung meiner Kernfragen/meines Themas zu den im Studium erlernten Inhalten?],
    studium,
    header_h: 29.9pt,
    body_h: 120.6pt,
    width: 460.1pt,
    header_top: 3.3pt,
  )
  v(48.1pt)
  form_box(
    [Auf welche Informationen stütze ich meine Arbeit und warum habe ich diese Informationsbasis gewählt?],
    informationen,
    header_h: 29.7pt,
    body_h: 137.3pt,
    width: 462.6pt,
    header_top: 3.3pt,
  )
  v(44.1pt)
  form_box(
    [Wie ist mein Vorgehen zur Lösung des Themas?],
    vorgehen,
    header_h: 29.9pt,
    body_h: 128.3pt,
    width: 463.7pt,
    header_top: 3.3pt,
  )

  pagebreak()
  v(70.9pt)
  form_box(
    [Worin besteht konkret meine Eigenleistung?],
    eigenleistung,
    header_h: 28.5pt,
    body_h: 102.6pt,
    width: 472.5pt,
    header_top: 3.3pt,
  )
  v(48.0pt)
  form_box(
    [Was habe ich durch die Transferleistung gelernt und was würde ich ggf. beim nächsten Mal anders machen? Ein Verweis zu einem Kapitel ist hier optional.],
    gelernt,
    header_h: 29.7pt,
    body_h: 113.1pt,
    width: 472.5pt,
    header_top: 3.3pt,
  )
  v(51pt)
  par(justify: true, fixed_lines(
    [Laden Sie die ausgefüllte Selbstreflexion (als eigenständiges Dokument) zusammen mit Ihrer],
    [Transferleistung im Campus Informations-System (CIS) hoch.],
  ))
}
